; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_12_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %src5 = alloca [150 x i8], align 16
  %dest6 = alloca [100 x i8], align 16
  %i7 = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !40
  %cmp = icmp slt i32 %0, 99, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %1 to i64, !dbg !46
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !46
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !46
  %3 = load i32, i32* %i, align 4, !dbg !47
  %idxprom2 = sext i32 %3 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !48
  store i8 %2, i8* %arrayidx3, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %4, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay4), !dbg !57
  br label %if.end, !dbg !58

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src5, metadata !59, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest6, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !65, metadata !DIExpression()), !dbg !66
  %arraydecay8 = getelementptr inbounds [150 x i8], [150 x i8]* %src5, i64 0, i64 0, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay8, i8 65, i64 149, i1 false), !dbg !67
  %arrayidx9 = getelementptr inbounds [150 x i8], [150 x i8]* %src5, i64 0, i64 149, !dbg !68
  store i8 0, i8* %arrayidx9, align 1, !dbg !69
  store i32 0, i32* %i7, align 4, !dbg !70
  br label %for.cond10, !dbg !72

for.cond10:                                       ; preds = %for.inc17, %if.else
  %5 = load i32, i32* %i7, align 4, !dbg !73
  %cmp11 = icmp slt i32 %5, 99, !dbg !75
  br i1 %cmp11, label %for.body12, label %for.end19, !dbg !76

for.body12:                                       ; preds = %for.cond10
  %6 = load i32, i32* %i7, align 4, !dbg !77
  %idxprom13 = sext i32 %6 to i64, !dbg !79
  %arrayidx14 = getelementptr inbounds [150 x i8], [150 x i8]* %src5, i64 0, i64 %idxprom13, !dbg !79
  %7 = load i8, i8* %arrayidx14, align 1, !dbg !79
  %8 = load i32, i32* %i7, align 4, !dbg !80
  %idxprom15 = sext i32 %8 to i64, !dbg !81
  %arrayidx16 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 %idxprom15, !dbg !81
  store i8 %7, i8* %arrayidx16, align 1, !dbg !82
  br label %for.inc17, !dbg !83

for.inc17:                                        ; preds = %for.body12
  %9 = load i32, i32* %i7, align 4, !dbg !84
  %inc18 = add nsw i32 %9, 1, !dbg !84
  store i32 %inc18, i32* %i7, align 4, !dbg !84
  br label %for.cond10, !dbg !85, !llvm.loop !86

for.end19:                                        ; preds = %for.cond10
  %arrayidx20 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx20, align 1, !dbg !89
  %arraydecay21 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 0, !dbg !90
  call void @printLine(i8* %arraydecay21), !dbg !91
  br label %if.end

if.end:                                           ; preds = %for.end19, %for.end
  ret void, !dbg !92
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_12_good() #0 !dbg !93 {
entry:
  call void @good1(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #5, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #5, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__CWE170_char_loop_12_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__CWE170_char_loop_12_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !115 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %src6 = alloca [150 x i8], align 16
  %dest7 = alloca [100 x i8], align 16
  %i8 = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !119, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !127
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  store i32 0, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !133
  %cmp = icmp slt i32 %0, 99, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !137
  %idxprom = sext i32 %1 to i64, !dbg !139
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !139
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !139
  %3 = load i32, i32* %i, align 4, !dbg !140
  %idxprom2 = sext i32 %3 to i64, !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !141
  store i8 %2, i8* %arrayidx3, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %4, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx4, align 1, !dbg !149
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @printLine(i8* %arraydecay5), !dbg !151
  br label %if.end, !dbg !152

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src6, metadata !153, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest7, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32* %i8, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay9 = getelementptr inbounds [150 x i8], [150 x i8]* %src6, i64 0, i64 0, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay9, i8 65, i64 149, i1 false), !dbg !161
  %arrayidx10 = getelementptr inbounds [150 x i8], [150 x i8]* %src6, i64 0, i64 149, !dbg !162
  store i8 0, i8* %arrayidx10, align 1, !dbg !163
  store i32 0, i32* %i8, align 4, !dbg !164
  br label %for.cond11, !dbg !166

for.cond11:                                       ; preds = %for.inc18, %if.else
  %5 = load i32, i32* %i8, align 4, !dbg !167
  %cmp12 = icmp slt i32 %5, 99, !dbg !169
  br i1 %cmp12, label %for.body13, label %for.end20, !dbg !170

for.body13:                                       ; preds = %for.cond11
  %6 = load i32, i32* %i8, align 4, !dbg !171
  %idxprom14 = sext i32 %6 to i64, !dbg !173
  %arrayidx15 = getelementptr inbounds [150 x i8], [150 x i8]* %src6, i64 0, i64 %idxprom14, !dbg !173
  %7 = load i8, i8* %arrayidx15, align 1, !dbg !173
  %8 = load i32, i32* %i8, align 4, !dbg !174
  %idxprom16 = sext i32 %8 to i64, !dbg !175
  %arrayidx17 = getelementptr inbounds [100 x i8], [100 x i8]* %dest7, i64 0, i64 %idxprom16, !dbg !175
  store i8 %7, i8* %arrayidx17, align 1, !dbg !176
  br label %for.inc18, !dbg !177

for.inc18:                                        ; preds = %for.body13
  %9 = load i32, i32* %i8, align 4, !dbg !178
  %inc19 = add nsw i32 %9, 1, !dbg !178
  store i32 %inc19, i32* %i8, align 4, !dbg !178
  br label %for.cond11, !dbg !179, !llvm.loop !180

for.end20:                                        ; preds = %for.cond11
  %arrayidx21 = getelementptr inbounds [100 x i8], [100 x i8]* %dest7, i64 0, i64 99, !dbg !182
  store i8 0, i8* %arrayidx21, align 1, !dbg !183
  %arraydecay22 = getelementptr inbounds [100 x i8], [100 x i8]* %dest7, i64 0, i64 0, !dbg !184
  call void @printLine(i8* %arraydecay22), !dbg !185
  br label %if.end

if.end:                                           ; preds = %for.end20, %for.end
  ret void, !dbg !186
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 27, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 26, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1200, elements: !23)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 27, column: 18, scope: !19)
!26 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 28, scope: !19)
!31 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 28, type: !32)
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DILocation(line: 28, column: 17, scope: !19)
!34 = !DILocation(line: 30, column: 13, scope: !19)
!35 = !DILocation(line: 31, column: 13, scope: !19)
!36 = !DILocation(line: 31, column: 22, scope: !19)
!37 = !DILocation(line: 32, column: 18, scope: !38)
!38 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 13)
!39 = !DILocation(line: 32, column: 17, scope: !38)
!40 = !DILocation(line: 32, column: 22, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 32, column: 13)
!42 = !DILocation(line: 32, column: 24, scope: !41)
!43 = !DILocation(line: 32, column: 13, scope: !38)
!44 = !DILocation(line: 34, column: 31, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 33, column: 13)
!46 = !DILocation(line: 34, column: 27, scope: !45)
!47 = !DILocation(line: 34, column: 22, scope: !45)
!48 = !DILocation(line: 34, column: 17, scope: !45)
!49 = !DILocation(line: 34, column: 25, scope: !45)
!50 = !DILocation(line: 35, column: 13, scope: !45)
!51 = !DILocation(line: 32, column: 31, scope: !41)
!52 = !DILocation(line: 32, column: 13, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 35, column: 13, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 37, column: 23, scope: !19)
!57 = !DILocation(line: 37, column: 13, scope: !19)
!58 = !DILocation(line: 39, column: 5, scope: !20)
!59 = !DILocalVariable(name: "src", scope: !60, file: !12, line: 43, type: !21)
!60 = distinct !DILexicalBlock(scope: !61, file: !12, line: 42, column: 9)
!61 = distinct !DILexicalBlock(scope: !16, file: !12, line: 41, column: 5)
!62 = !DILocation(line: 43, column: 18, scope: !60)
!63 = !DILocalVariable(name: "dest", scope: !60, file: !12, line: 43, type: !27)
!64 = !DILocation(line: 43, column: 28, scope: !60)
!65 = !DILocalVariable(name: "i", scope: !60, file: !12, line: 44, type: !32)
!66 = !DILocation(line: 44, column: 17, scope: !60)
!67 = !DILocation(line: 46, column: 13, scope: !60)
!68 = !DILocation(line: 47, column: 13, scope: !60)
!69 = !DILocation(line: 47, column: 22, scope: !60)
!70 = !DILocation(line: 48, column: 18, scope: !71)
!71 = distinct !DILexicalBlock(scope: !60, file: !12, line: 48, column: 13)
!72 = !DILocation(line: 48, column: 17, scope: !71)
!73 = !DILocation(line: 48, column: 22, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !12, line: 48, column: 13)
!75 = !DILocation(line: 48, column: 24, scope: !74)
!76 = !DILocation(line: 48, column: 13, scope: !71)
!77 = !DILocation(line: 50, column: 31, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !12, line: 49, column: 13)
!79 = !DILocation(line: 50, column: 27, scope: !78)
!80 = !DILocation(line: 50, column: 22, scope: !78)
!81 = !DILocation(line: 50, column: 17, scope: !78)
!82 = !DILocation(line: 50, column: 25, scope: !78)
!83 = !DILocation(line: 51, column: 13, scope: !78)
!84 = !DILocation(line: 48, column: 31, scope: !74)
!85 = !DILocation(line: 48, column: 13, scope: !74)
!86 = distinct !{!86, !76, !87, !55}
!87 = !DILocation(line: 51, column: 13, scope: !71)
!88 = !DILocation(line: 52, column: 13, scope: !60)
!89 = !DILocation(line: 52, column: 22, scope: !60)
!90 = !DILocation(line: 53, column: 23, scope: !60)
!91 = !DILocation(line: 53, column: 13, scope: !60)
!92 = !DILocation(line: 56, column: 1, scope: !11)
!93 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_12_good", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 101, column: 5, scope: !93)
!95 = !DILocation(line: 102, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !97, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!32, !32, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !12, line: 113, type: !32)
!102 = !DILocation(line: 113, column: 14, scope: !96)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !12, line: 113, type: !99)
!104 = !DILocation(line: 113, column: 27, scope: !96)
!105 = !DILocation(line: 116, column: 22, scope: !96)
!106 = !DILocation(line: 116, column: 12, scope: !96)
!107 = !DILocation(line: 116, column: 5, scope: !96)
!108 = !DILocation(line: 118, column: 5, scope: !96)
!109 = !DILocation(line: 119, column: 5, scope: !96)
!110 = !DILocation(line: 120, column: 5, scope: !96)
!111 = !DILocation(line: 123, column: 5, scope: !96)
!112 = !DILocation(line: 124, column: 5, scope: !96)
!113 = !DILocation(line: 125, column: 5, scope: !96)
!114 = !DILocation(line: 127, column: 5, scope: !96)
!115 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 65, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !115, file: !12, line: 65, column: 8)
!118 = !DILocation(line: 65, column: 8, scope: !115)
!119 = !DILocalVariable(name: "src", scope: !120, file: !12, line: 68, type: !21)
!120 = distinct !DILexicalBlock(scope: !121, file: !12, line: 67, column: 9)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 66, column: 5)
!122 = !DILocation(line: 68, column: 18, scope: !120)
!123 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 68, type: !27)
!124 = !DILocation(line: 68, column: 28, scope: !120)
!125 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 69, type: !32)
!126 = !DILocation(line: 69, column: 17, scope: !120)
!127 = !DILocation(line: 71, column: 13, scope: !120)
!128 = !DILocation(line: 72, column: 13, scope: !120)
!129 = !DILocation(line: 72, column: 22, scope: !120)
!130 = !DILocation(line: 73, column: 18, scope: !131)
!131 = distinct !DILexicalBlock(scope: !120, file: !12, line: 73, column: 13)
!132 = !DILocation(line: 73, column: 17, scope: !131)
!133 = !DILocation(line: 73, column: 22, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 73, column: 13)
!135 = !DILocation(line: 73, column: 24, scope: !134)
!136 = !DILocation(line: 73, column: 13, scope: !131)
!137 = !DILocation(line: 75, column: 31, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 74, column: 13)
!139 = !DILocation(line: 75, column: 27, scope: !138)
!140 = !DILocation(line: 75, column: 22, scope: !138)
!141 = !DILocation(line: 75, column: 17, scope: !138)
!142 = !DILocation(line: 75, column: 25, scope: !138)
!143 = !DILocation(line: 76, column: 13, scope: !138)
!144 = !DILocation(line: 73, column: 31, scope: !134)
!145 = !DILocation(line: 73, column: 13, scope: !134)
!146 = distinct !{!146, !136, !147, !55}
!147 = !DILocation(line: 76, column: 13, scope: !131)
!148 = !DILocation(line: 77, column: 13, scope: !120)
!149 = !DILocation(line: 77, column: 22, scope: !120)
!150 = !DILocation(line: 78, column: 23, scope: !120)
!151 = !DILocation(line: 78, column: 13, scope: !120)
!152 = !DILocation(line: 80, column: 5, scope: !121)
!153 = !DILocalVariable(name: "src", scope: !154, file: !12, line: 84, type: !21)
!154 = distinct !DILexicalBlock(scope: !155, file: !12, line: 83, column: 9)
!155 = distinct !DILexicalBlock(scope: !117, file: !12, line: 82, column: 5)
!156 = !DILocation(line: 84, column: 18, scope: !154)
!157 = !DILocalVariable(name: "dest", scope: !154, file: !12, line: 84, type: !27)
!158 = !DILocation(line: 84, column: 28, scope: !154)
!159 = !DILocalVariable(name: "i", scope: !154, file: !12, line: 85, type: !32)
!160 = !DILocation(line: 85, column: 17, scope: !154)
!161 = !DILocation(line: 87, column: 13, scope: !154)
!162 = !DILocation(line: 88, column: 13, scope: !154)
!163 = !DILocation(line: 88, column: 22, scope: !154)
!164 = !DILocation(line: 89, column: 18, scope: !165)
!165 = distinct !DILexicalBlock(scope: !154, file: !12, line: 89, column: 13)
!166 = !DILocation(line: 89, column: 17, scope: !165)
!167 = !DILocation(line: 89, column: 22, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 89, column: 13)
!169 = !DILocation(line: 89, column: 24, scope: !168)
!170 = !DILocation(line: 89, column: 13, scope: !165)
!171 = !DILocation(line: 91, column: 31, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !12, line: 90, column: 13)
!173 = !DILocation(line: 91, column: 27, scope: !172)
!174 = !DILocation(line: 91, column: 22, scope: !172)
!175 = !DILocation(line: 91, column: 17, scope: !172)
!176 = !DILocation(line: 91, column: 25, scope: !172)
!177 = !DILocation(line: 92, column: 13, scope: !172)
!178 = !DILocation(line: 89, column: 31, scope: !168)
!179 = !DILocation(line: 89, column: 13, scope: !168)
!180 = distinct !{!180, !170, !181, !55}
!181 = !DILocation(line: 92, column: 13, scope: !165)
!182 = !DILocation(line: 93, column: 13, scope: !154)
!183 = !DILocation(line: 93, column: 22, scope: !154)
!184 = !DILocation(line: 94, column: 23, scope: !154)
!185 = !DILocation(line: 94, column: 13, scope: !154)
!186 = !DILocation(line: 97, column: 1, scope: !115)
