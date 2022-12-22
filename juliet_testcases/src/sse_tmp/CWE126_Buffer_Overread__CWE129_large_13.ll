; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !23
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !26
  %cmp1 = icmp eq i32 %1, 5, !dbg !28
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !29

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !30, metadata !DIExpression()), !dbg !36
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !36
  %3 = load i32, i32* %data, align 4, !dbg !37
  %cmp3 = icmp sge i32 %3, 0, !dbg !39
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !40

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !41
  %idxprom = sext i32 %4 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !43
  %5 = load i32, i32* %arrayidx, align 4, !dbg !43
  call void @printIntLine(i32 %5), !dbg !44
  br label %if.end5, !dbg !45

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !46
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !48

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_13_good() #0 !dbg !50 {
entry:
  call void @goodB2G1(), !dbg !51
  call void @goodB2G2(), !dbg !52
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__CWE129_large_13_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__CWE129_large_13_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !76 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !80
  %cmp = icmp eq i32 %0, 5, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !84
  br label %if.end, !dbg !86

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !87
  %cmp1 = icmp ne i32 %1, 5, !dbg !89
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !90

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  br label %if.end8, !dbg !93

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !94, metadata !DIExpression()), !dbg !97
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !97
  %3 = load i32, i32* %data, align 4, !dbg !98
  %cmp3 = icmp sge i32 %3, 0, !dbg !100
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !101

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !102
  %cmp4 = icmp slt i32 %4, 10, !dbg !103
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !104

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !105
  %idxprom = sext i32 %5 to i64, !dbg !107
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !107
  %6 = load i32, i32* %arrayidx, align 4, !dbg !107
  call void @printIntLine(i32 %6), !dbg !108
  br label %if.end7, !dbg !109

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !110
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then2
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !113 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %data, align 4, !dbg !116
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !117
  %cmp = icmp eq i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !121
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !124
  %cmp1 = icmp eq i32 %1, 5, !dbg !126
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !127

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !128, metadata !DIExpression()), !dbg !131
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !131
  %3 = load i32, i32* %data, align 4, !dbg !132
  %cmp3 = icmp sge i32 %3, 0, !dbg !134
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !135

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !136
  %cmp4 = icmp slt i32 %4, 10, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !138

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !139
  %idxprom = sext i32 %5 to i64, !dbg !141
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !141
  %6 = load i32, i32* %arrayidx, align 4, !dbg !141
  call void @printIntLine(i32 %6), !dbg !142
  br label %if.end6, !dbg !143

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !144
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then5
  br label %if.end7, !dbg !146

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !152
  %cmp = icmp ne i32 %0, 5, !dbg !154
  br i1 %cmp, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !156
  br label %if.end, !dbg !158

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !159
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !161
  %cmp1 = icmp eq i32 %1, 5, !dbg !163
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !164

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !165, metadata !DIExpression()), !dbg !168
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !168
  %3 = load i32, i32* %data, align 4, !dbg !169
  %cmp3 = icmp sge i32 %3, 0, !dbg !171
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !172

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !173
  %idxprom = sext i32 %4 to i64, !dbg !175
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !175
  %5 = load i32, i32* %arrayidx, align 4, !dbg !175
  call void @printIntLine(i32 %5), !dbg !176
  br label %if.end6, !dbg !177

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !178
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !180

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !182 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !183, metadata !DIExpression()), !dbg !184
  store i32 -1, i32* %data, align 4, !dbg !185
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !186
  %cmp = icmp eq i32 %0, 5, !dbg !188
  br i1 %cmp, label %if.then, label %if.end, !dbg !189

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !190
  br label %if.end, !dbg !192

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !193
  %cmp1 = icmp eq i32 %1, 5, !dbg !195
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !196

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !197, metadata !DIExpression()), !dbg !200
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !200
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !200
  %3 = load i32, i32* %data, align 4, !dbg !201
  %cmp3 = icmp sge i32 %3, 0, !dbg !203
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !204

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !205
  %idxprom = sext i32 %4 to i64, !dbg !207
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !207
  %5 = load i32, i32* %arrayidx, align 4, !dbg !207
  call void @printIntLine(i32 %5), !dbg !208
  br label %if.end5, !dbg !209

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !210
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !212

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !213
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_13_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_13.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 25, scope: !20)
!22 = !DILocation(line: 27, column: 8, scope: !11)
!23 = !DILocation(line: 30, column: 14, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 31, column: 5, scope: !24)
!26 = !DILocation(line: 32, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!28 = !DILocation(line: 32, column: 25, scope: !27)
!29 = !DILocation(line: 32, column: 8, scope: !11)
!30 = !DILocalVariable(name: "buffer", scope: !31, file: !12, line: 35, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 34, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !12, line: 33, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 35, column: 17, scope: !31)
!37 = !DILocation(line: 38, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 38, column: 17)
!39 = !DILocation(line: 38, column: 22, scope: !38)
!40 = !DILocation(line: 38, column: 17, scope: !31)
!41 = !DILocation(line: 40, column: 37, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 39, column: 13)
!43 = !DILocation(line: 40, column: 30, scope: !42)
!44 = !DILocation(line: 40, column: 17, scope: !42)
!45 = !DILocation(line: 41, column: 13, scope: !42)
!46 = !DILocation(line: 44, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !12, line: 43, column: 13)
!48 = !DILocation(line: 47, column: 5, scope: !32)
!49 = !DILocation(line: 48, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_13_good", scope: !12, file: !12, line: 180, type: !13, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 182, column: 5, scope: !50)
!52 = !DILocation(line: 183, column: 5, scope: !50)
!53 = !DILocation(line: 184, column: 5, scope: !50)
!54 = !DILocation(line: 185, column: 5, scope: !50)
!55 = !DILocation(line: 186, column: 1, scope: !50)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 197, type: !57, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!16, !16, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 197, type: !16)
!63 = !DILocation(line: 197, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 197, type: !59)
!65 = !DILocation(line: 197, column: 27, scope: !56)
!66 = !DILocation(line: 200, column: 22, scope: !56)
!67 = !DILocation(line: 200, column: 12, scope: !56)
!68 = !DILocation(line: 200, column: 5, scope: !56)
!69 = !DILocation(line: 202, column: 5, scope: !56)
!70 = !DILocation(line: 203, column: 5, scope: !56)
!71 = !DILocation(line: 204, column: 5, scope: !56)
!72 = !DILocation(line: 207, column: 5, scope: !56)
!73 = !DILocation(line: 208, column: 5, scope: !56)
!74 = !DILocation(line: 209, column: 5, scope: !56)
!75 = !DILocation(line: 211, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 57, type: !16)
!78 = !DILocation(line: 57, column: 9, scope: !76)
!79 = !DILocation(line: 59, column: 10, scope: !76)
!80 = !DILocation(line: 60, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !12, line: 60, column: 8)
!82 = !DILocation(line: 60, column: 25, scope: !81)
!83 = !DILocation(line: 60, column: 8, scope: !76)
!84 = !DILocation(line: 63, column: 14, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 61, column: 5)
!86 = !DILocation(line: 64, column: 5, scope: !85)
!87 = !DILocation(line: 65, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !76, file: !12, line: 65, column: 8)
!89 = !DILocation(line: 65, column: 25, scope: !88)
!90 = !DILocation(line: 65, column: 8, scope: !76)
!91 = !DILocation(line: 68, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !12, line: 66, column: 5)
!93 = !DILocation(line: 69, column: 5, scope: !92)
!94 = !DILocalVariable(name: "buffer", scope: !95, file: !12, line: 73, type: !33)
!95 = distinct !DILexicalBlock(scope: !96, file: !12, line: 72, column: 9)
!96 = distinct !DILexicalBlock(scope: !88, file: !12, line: 71, column: 5)
!97 = !DILocation(line: 73, column: 17, scope: !95)
!98 = !DILocation(line: 75, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 75, column: 17)
!100 = !DILocation(line: 75, column: 22, scope: !99)
!101 = !DILocation(line: 75, column: 27, scope: !99)
!102 = !DILocation(line: 75, column: 30, scope: !99)
!103 = !DILocation(line: 75, column: 35, scope: !99)
!104 = !DILocation(line: 75, column: 17, scope: !95)
!105 = !DILocation(line: 77, column: 37, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !12, line: 76, column: 13)
!107 = !DILocation(line: 77, column: 30, scope: !106)
!108 = !DILocation(line: 77, column: 17, scope: !106)
!109 = !DILocation(line: 78, column: 13, scope: !106)
!110 = !DILocation(line: 81, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !12, line: 80, column: 13)
!112 = !DILocation(line: 85, column: 1, scope: !76)
!113 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 90, type: !16)
!115 = !DILocation(line: 90, column: 9, scope: !113)
!116 = !DILocation(line: 92, column: 10, scope: !113)
!117 = !DILocation(line: 93, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !12, line: 93, column: 8)
!119 = !DILocation(line: 93, column: 25, scope: !118)
!120 = !DILocation(line: 93, column: 8, scope: !113)
!121 = !DILocation(line: 96, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 94, column: 5)
!123 = !DILocation(line: 97, column: 5, scope: !122)
!124 = !DILocation(line: 98, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !12, line: 98, column: 8)
!126 = !DILocation(line: 98, column: 25, scope: !125)
!127 = !DILocation(line: 98, column: 8, scope: !113)
!128 = !DILocalVariable(name: "buffer", scope: !129, file: !12, line: 101, type: !33)
!129 = distinct !DILexicalBlock(scope: !130, file: !12, line: 100, column: 9)
!130 = distinct !DILexicalBlock(scope: !125, file: !12, line: 99, column: 5)
!131 = !DILocation(line: 101, column: 17, scope: !129)
!132 = !DILocation(line: 103, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 103, column: 17)
!134 = !DILocation(line: 103, column: 22, scope: !133)
!135 = !DILocation(line: 103, column: 27, scope: !133)
!136 = !DILocation(line: 103, column: 30, scope: !133)
!137 = !DILocation(line: 103, column: 35, scope: !133)
!138 = !DILocation(line: 103, column: 17, scope: !129)
!139 = !DILocation(line: 105, column: 37, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !12, line: 104, column: 13)
!141 = !DILocation(line: 105, column: 30, scope: !140)
!142 = !DILocation(line: 105, column: 17, scope: !140)
!143 = !DILocation(line: 106, column: 13, scope: !140)
!144 = !DILocation(line: 109, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !133, file: !12, line: 108, column: 13)
!146 = !DILocation(line: 112, column: 5, scope: !130)
!147 = !DILocation(line: 113, column: 1, scope: !113)
!148 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !12, line: 118, type: !16)
!150 = !DILocation(line: 118, column: 9, scope: !148)
!151 = !DILocation(line: 120, column: 10, scope: !148)
!152 = !DILocation(line: 121, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 121, column: 8)
!154 = !DILocation(line: 121, column: 25, scope: !153)
!155 = !DILocation(line: 121, column: 8, scope: !148)
!156 = !DILocation(line: 124, column: 9, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !12, line: 122, column: 5)
!158 = !DILocation(line: 125, column: 5, scope: !157)
!159 = !DILocation(line: 130, column: 14, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !12, line: 127, column: 5)
!161 = !DILocation(line: 132, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !148, file: !12, line: 132, column: 8)
!163 = !DILocation(line: 132, column: 25, scope: !162)
!164 = !DILocation(line: 132, column: 8, scope: !148)
!165 = !DILocalVariable(name: "buffer", scope: !166, file: !12, line: 135, type: !33)
!166 = distinct !DILexicalBlock(scope: !167, file: !12, line: 134, column: 9)
!167 = distinct !DILexicalBlock(scope: !162, file: !12, line: 133, column: 5)
!168 = !DILocation(line: 135, column: 17, scope: !166)
!169 = !DILocation(line: 138, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !12, line: 138, column: 17)
!171 = !DILocation(line: 138, column: 22, scope: !170)
!172 = !DILocation(line: 138, column: 17, scope: !166)
!173 = !DILocation(line: 140, column: 37, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !12, line: 139, column: 13)
!175 = !DILocation(line: 140, column: 30, scope: !174)
!176 = !DILocation(line: 140, column: 17, scope: !174)
!177 = !DILocation(line: 141, column: 13, scope: !174)
!178 = !DILocation(line: 144, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !170, file: !12, line: 143, column: 13)
!180 = !DILocation(line: 147, column: 5, scope: !167)
!181 = !DILocation(line: 148, column: 1, scope: !148)
!182 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 151, type: !13, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!183 = !DILocalVariable(name: "data", scope: !182, file: !12, line: 153, type: !16)
!184 = !DILocation(line: 153, column: 9, scope: !182)
!185 = !DILocation(line: 155, column: 10, scope: !182)
!186 = !DILocation(line: 156, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !12, line: 156, column: 8)
!188 = !DILocation(line: 156, column: 25, scope: !187)
!189 = !DILocation(line: 156, column: 8, scope: !182)
!190 = !DILocation(line: 160, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !12, line: 157, column: 5)
!192 = !DILocation(line: 161, column: 5, scope: !191)
!193 = !DILocation(line: 162, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !182, file: !12, line: 162, column: 8)
!195 = !DILocation(line: 162, column: 25, scope: !194)
!196 = !DILocation(line: 162, column: 8, scope: !182)
!197 = !DILocalVariable(name: "buffer", scope: !198, file: !12, line: 165, type: !33)
!198 = distinct !DILexicalBlock(scope: !199, file: !12, line: 164, column: 9)
!199 = distinct !DILexicalBlock(scope: !194, file: !12, line: 163, column: 5)
!200 = !DILocation(line: 165, column: 17, scope: !198)
!201 = !DILocation(line: 168, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !12, line: 168, column: 17)
!203 = !DILocation(line: 168, column: 22, scope: !202)
!204 = !DILocation(line: 168, column: 17, scope: !198)
!205 = !DILocation(line: 170, column: 37, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !12, line: 169, column: 13)
!207 = !DILocation(line: 170, column: 30, scope: !206)
!208 = !DILocation(line: 170, column: 17, scope: !206)
!209 = !DILocation(line: 171, column: 13, scope: !206)
!210 = !DILocation(line: 174, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !202, file: !12, line: 173, column: 13)
!212 = !DILocation(line: 177, column: 5, scope: !199)
!213 = !DILocation(line: 178, column: 1, scope: !182)
