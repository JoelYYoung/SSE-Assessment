; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load i32, i32* @staticFive, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 5, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !26
  br label %if.end, !dbg !28

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp1 = icmp eq i32 %1, 5, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !32

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !33, metadata !DIExpression()), !dbg !39
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !39
  %3 = load i32, i32* %data, align 4, !dbg !40
  %cmp3 = icmp slt i32 %3, 10, !dbg !42
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !43

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !44
  %idxprom = sext i32 %4 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  %5 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 %5), !dbg !47
  br label %if.end5, !dbg !48

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !49
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_07_good() #0 !dbg !53 {
entry:
  call void @goodB2G1(), !dbg !54
  call void @goodB2G2(), !dbg !55
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__CWE839_negative_07_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__CWE839_negative_07_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !79 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  %0 = load i32, i32* @staticFive, align 4, !dbg !83
  %cmp = icmp eq i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !87
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !90
  %cmp1 = icmp ne i32 %1, 5, !dbg !92
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end8, !dbg !96

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !97, metadata !DIExpression()), !dbg !100
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !100
  %3 = load i32, i32* %data, align 4, !dbg !101
  %cmp3 = icmp sge i32 %3, 0, !dbg !103
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !104

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !105
  %cmp4 = icmp slt i32 %4, 10, !dbg !106
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !107

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !108
  %idxprom = sext i32 %5 to i64, !dbg !110
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !110
  %6 = load i32, i32* %arrayidx, align 4, !dbg !110
  call void @printIntLine(i32 %6), !dbg !111
  br label %if.end7, !dbg !112

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !113
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then2
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !116 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  %0 = load i32, i32* @staticFive, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !124
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !127
  %cmp1 = icmp eq i32 %1, 5, !dbg !129
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !130

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !134
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !134
  %3 = load i32, i32* %data, align 4, !dbg !135
  %cmp3 = icmp sge i32 %3, 0, !dbg !137
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !138

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !139
  %cmp4 = icmp slt i32 %4, 10, !dbg !140
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !141

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %5 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %6 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 %6), !dbg !145
  br label %if.end6, !dbg !146

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !147
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then5
  br label %if.end7, !dbg !149

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !151 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 -1, i32* %data, align 4, !dbg !154
  %0 = load i32, i32* @staticFive, align 4, !dbg !155
  %cmp = icmp ne i32 %0, 5, !dbg !157
  br i1 %cmp, label %if.then, label %if.else, !dbg !158

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !159
  br label %if.end, !dbg !161

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !162
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !164
  %cmp1 = icmp eq i32 %1, 5, !dbg !166
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !167

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !168, metadata !DIExpression()), !dbg !171
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !171
  %3 = load i32, i32* %data, align 4, !dbg !172
  %cmp3 = icmp slt i32 %3, 10, !dbg !174
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !175

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !176
  %idxprom = sext i32 %4 to i64, !dbg !178
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !178
  %5 = load i32, i32* %arrayidx, align 4, !dbg !178
  call void @printIntLine(i32 %5), !dbg !179
  br label %if.end6, !dbg !180

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !181
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !183

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  %0 = load i32, i32* @staticFive, align 4, !dbg !189
  %cmp = icmp eq i32 %0, 5, !dbg !191
  br i1 %cmp, label %if.then, label %if.end, !dbg !192

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !193
  br label %if.end, !dbg !195

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !196
  %cmp1 = icmp eq i32 %1, 5, !dbg !198
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !199

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !200, metadata !DIExpression()), !dbg !203
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !203
  %3 = load i32, i32* %data, align 4, !dbg !204
  %cmp3 = icmp slt i32 %3, 10, !dbg !206
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !207

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !208
  %idxprom = sext i32 %4 to i64, !dbg !210
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !210
  %5 = load i32, i32* %arrayidx, align 4, !dbg !210
  call void @printIntLine(i32 %5), !dbg !211
  br label %if.end5, !dbg !212

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !213
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !215

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !216
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !9)
!20 = !DILocation(line: 29, column: 9, scope: !16)
!21 = !DILocation(line: 31, column: 10, scope: !16)
!22 = !DILocation(line: 32, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!24 = !DILocation(line: 32, column: 18, scope: !23)
!25 = !DILocation(line: 32, column: 8, scope: !16)
!26 = !DILocation(line: 35, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !8, line: 33, column: 5)
!28 = !DILocation(line: 36, column: 5, scope: !27)
!29 = !DILocation(line: 37, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !8, line: 37, column: 8)
!31 = !DILocation(line: 37, column: 18, scope: !30)
!32 = !DILocation(line: 37, column: 8, scope: !16)
!33 = !DILocalVariable(name: "buffer", scope: !34, file: !8, line: 40, type: !36)
!34 = distinct !DILexicalBlock(scope: !35, file: !8, line: 39, column: 9)
!35 = distinct !DILexicalBlock(scope: !30, file: !8, line: 38, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 40, column: 17, scope: !34)
!40 = !DILocation(line: 43, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !8, line: 43, column: 17)
!42 = !DILocation(line: 43, column: 22, scope: !41)
!43 = !DILocation(line: 43, column: 17, scope: !34)
!44 = !DILocation(line: 45, column: 37, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !8, line: 44, column: 13)
!46 = !DILocation(line: 45, column: 30, scope: !45)
!47 = !DILocation(line: 45, column: 17, scope: !45)
!48 = !DILocation(line: 46, column: 13, scope: !45)
!49 = !DILocation(line: 49, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !8, line: 48, column: 13)
!51 = !DILocation(line: 52, column: 5, scope: !35)
!52 = !DILocation(line: 53, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_07_good", scope: !8, file: !8, line: 185, type: !17, scopeLine: 186, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 187, column: 5, scope: !53)
!55 = !DILocation(line: 188, column: 5, scope: !53)
!56 = !DILocation(line: 189, column: 5, scope: !53)
!57 = !DILocation(line: 190, column: 5, scope: !53)
!58 = !DILocation(line: 191, column: 1, scope: !53)
!59 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 202, type: !60, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!9, !9, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !8, line: 202, type: !9)
!66 = !DILocation(line: 202, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !8, line: 202, type: !62)
!68 = !DILocation(line: 202, column: 27, scope: !59)
!69 = !DILocation(line: 205, column: 22, scope: !59)
!70 = !DILocation(line: 205, column: 12, scope: !59)
!71 = !DILocation(line: 205, column: 5, scope: !59)
!72 = !DILocation(line: 207, column: 5, scope: !59)
!73 = !DILocation(line: 208, column: 5, scope: !59)
!74 = !DILocation(line: 209, column: 5, scope: !59)
!75 = !DILocation(line: 212, column: 5, scope: !59)
!76 = !DILocation(line: 213, column: 5, scope: !59)
!77 = !DILocation(line: 214, column: 5, scope: !59)
!78 = !DILocation(line: 216, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodB2G1", scope: !8, file: !8, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !8, line: 62, type: !9)
!81 = !DILocation(line: 62, column: 9, scope: !79)
!82 = !DILocation(line: 64, column: 10, scope: !79)
!83 = !DILocation(line: 65, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !8, line: 65, column: 8)
!85 = !DILocation(line: 65, column: 18, scope: !84)
!86 = !DILocation(line: 65, column: 8, scope: !79)
!87 = !DILocation(line: 68, column: 14, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !8, line: 66, column: 5)
!89 = !DILocation(line: 69, column: 5, scope: !88)
!90 = !DILocation(line: 70, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !8, line: 70, column: 8)
!92 = !DILocation(line: 70, column: 18, scope: !91)
!93 = !DILocation(line: 70, column: 8, scope: !79)
!94 = !DILocation(line: 73, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !8, line: 71, column: 5)
!96 = !DILocation(line: 74, column: 5, scope: !95)
!97 = !DILocalVariable(name: "buffer", scope: !98, file: !8, line: 78, type: !36)
!98 = distinct !DILexicalBlock(scope: !99, file: !8, line: 77, column: 9)
!99 = distinct !DILexicalBlock(scope: !91, file: !8, line: 76, column: 5)
!100 = !DILocation(line: 78, column: 17, scope: !98)
!101 = !DILocation(line: 80, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !8, line: 80, column: 17)
!103 = !DILocation(line: 80, column: 22, scope: !102)
!104 = !DILocation(line: 80, column: 27, scope: !102)
!105 = !DILocation(line: 80, column: 30, scope: !102)
!106 = !DILocation(line: 80, column: 35, scope: !102)
!107 = !DILocation(line: 80, column: 17, scope: !98)
!108 = !DILocation(line: 82, column: 37, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !8, line: 81, column: 13)
!110 = !DILocation(line: 82, column: 30, scope: !109)
!111 = !DILocation(line: 82, column: 17, scope: !109)
!112 = !DILocation(line: 83, column: 13, scope: !109)
!113 = !DILocation(line: 86, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !8, line: 85, column: 13)
!115 = !DILocation(line: 90, column: 1, scope: !79)
!116 = distinct !DISubprogram(name: "goodB2G2", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !8, line: 95, type: !9)
!118 = !DILocation(line: 95, column: 9, scope: !116)
!119 = !DILocation(line: 97, column: 10, scope: !116)
!120 = !DILocation(line: 98, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !8, line: 98, column: 8)
!122 = !DILocation(line: 98, column: 18, scope: !121)
!123 = !DILocation(line: 98, column: 8, scope: !116)
!124 = !DILocation(line: 101, column: 14, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !8, line: 99, column: 5)
!126 = !DILocation(line: 102, column: 5, scope: !125)
!127 = !DILocation(line: 103, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !8, line: 103, column: 8)
!129 = !DILocation(line: 103, column: 18, scope: !128)
!130 = !DILocation(line: 103, column: 8, scope: !116)
!131 = !DILocalVariable(name: "buffer", scope: !132, file: !8, line: 106, type: !36)
!132 = distinct !DILexicalBlock(scope: !133, file: !8, line: 105, column: 9)
!133 = distinct !DILexicalBlock(scope: !128, file: !8, line: 104, column: 5)
!134 = !DILocation(line: 106, column: 17, scope: !132)
!135 = !DILocation(line: 108, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !8, line: 108, column: 17)
!137 = !DILocation(line: 108, column: 22, scope: !136)
!138 = !DILocation(line: 108, column: 27, scope: !136)
!139 = !DILocation(line: 108, column: 30, scope: !136)
!140 = !DILocation(line: 108, column: 35, scope: !136)
!141 = !DILocation(line: 108, column: 17, scope: !132)
!142 = !DILocation(line: 110, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !8, line: 109, column: 13)
!144 = !DILocation(line: 110, column: 30, scope: !143)
!145 = !DILocation(line: 110, column: 17, scope: !143)
!146 = !DILocation(line: 111, column: 13, scope: !143)
!147 = !DILocation(line: 114, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !136, file: !8, line: 113, column: 13)
!149 = !DILocation(line: 117, column: 5, scope: !133)
!150 = !DILocation(line: 118, column: 1, scope: !116)
!151 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 121, type: !17, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!152 = !DILocalVariable(name: "data", scope: !151, file: !8, line: 123, type: !9)
!153 = !DILocation(line: 123, column: 9, scope: !151)
!154 = !DILocation(line: 125, column: 10, scope: !151)
!155 = !DILocation(line: 126, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !8, line: 126, column: 8)
!157 = !DILocation(line: 126, column: 18, scope: !156)
!158 = !DILocation(line: 126, column: 8, scope: !151)
!159 = !DILocation(line: 129, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !8, line: 127, column: 5)
!161 = !DILocation(line: 130, column: 5, scope: !160)
!162 = !DILocation(line: 135, column: 14, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !8, line: 132, column: 5)
!164 = !DILocation(line: 137, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !151, file: !8, line: 137, column: 8)
!166 = !DILocation(line: 137, column: 18, scope: !165)
!167 = !DILocation(line: 137, column: 8, scope: !151)
!168 = !DILocalVariable(name: "buffer", scope: !169, file: !8, line: 140, type: !36)
!169 = distinct !DILexicalBlock(scope: !170, file: !8, line: 139, column: 9)
!170 = distinct !DILexicalBlock(scope: !165, file: !8, line: 138, column: 5)
!171 = !DILocation(line: 140, column: 17, scope: !169)
!172 = !DILocation(line: 143, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !8, line: 143, column: 17)
!174 = !DILocation(line: 143, column: 22, scope: !173)
!175 = !DILocation(line: 143, column: 17, scope: !169)
!176 = !DILocation(line: 145, column: 37, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !8, line: 144, column: 13)
!178 = !DILocation(line: 145, column: 30, scope: !177)
!179 = !DILocation(line: 145, column: 17, scope: !177)
!180 = !DILocation(line: 146, column: 13, scope: !177)
!181 = !DILocation(line: 149, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !173, file: !8, line: 148, column: 13)
!183 = !DILocation(line: 152, column: 5, scope: !170)
!184 = !DILocation(line: 153, column: 1, scope: !151)
!185 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 156, type: !17, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!186 = !DILocalVariable(name: "data", scope: !185, file: !8, line: 158, type: !9)
!187 = !DILocation(line: 158, column: 9, scope: !185)
!188 = !DILocation(line: 160, column: 10, scope: !185)
!189 = !DILocation(line: 161, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !8, line: 161, column: 8)
!191 = !DILocation(line: 161, column: 18, scope: !190)
!192 = !DILocation(line: 161, column: 8, scope: !185)
!193 = !DILocation(line: 165, column: 14, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !8, line: 162, column: 5)
!195 = !DILocation(line: 166, column: 5, scope: !194)
!196 = !DILocation(line: 167, column: 8, scope: !197)
!197 = distinct !DILexicalBlock(scope: !185, file: !8, line: 167, column: 8)
!198 = !DILocation(line: 167, column: 18, scope: !197)
!199 = !DILocation(line: 167, column: 8, scope: !185)
!200 = !DILocalVariable(name: "buffer", scope: !201, file: !8, line: 170, type: !36)
!201 = distinct !DILexicalBlock(scope: !202, file: !8, line: 169, column: 9)
!202 = distinct !DILexicalBlock(scope: !197, file: !8, line: 168, column: 5)
!203 = !DILocation(line: 170, column: 17, scope: !201)
!204 = !DILocation(line: 173, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !8, line: 173, column: 17)
!206 = !DILocation(line: 173, column: 22, scope: !205)
!207 = !DILocation(line: 173, column: 17, scope: !201)
!208 = !DILocation(line: 175, column: 37, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !8, line: 174, column: 13)
!210 = !DILocation(line: 175, column: 30, scope: !209)
!211 = !DILocation(line: 175, column: 17, scope: !209)
!212 = !DILocation(line: 176, column: 13, scope: !209)
!213 = !DILocation(line: 179, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !205, file: !8, line: 178, column: 13)
!215 = !DILocation(line: 182, column: 5, scope: !202)
!216 = !DILocation(line: 183, column: 1, scope: !185)
