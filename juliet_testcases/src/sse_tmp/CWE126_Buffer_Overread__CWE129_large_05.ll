; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %0 = load i32, i32* @staticTrue, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !27
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool1 = icmp ne i32 %1, 0, !dbg !30
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !32

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !33, metadata !DIExpression()), !dbg !39
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !39
  %3 = load i32, i32* %data, align 4, !dbg !40
  %cmp = icmp sge i32 %3, 0, !dbg !42
  br i1 %cmp, label %if.then3, label %if.else, !dbg !43

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !44
  %idxprom = sext i32 %4 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  %5 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 %5), !dbg !47
  br label %if.end4, !dbg !48

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !49
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !51

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_05_good() #0 !dbg !53 {
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
  call void @CWE126_Buffer_Overread__CWE129_large_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__CWE129_large_05_bad(), !dbg !76
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !86
  br label %if.end, !dbg !88

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !89
  %tobool1 = icmp ne i32 %1, 0, !dbg !89
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !91

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !92
  br label %if.end7, !dbg !94

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !95, metadata !DIExpression()), !dbg !98
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !98
  %3 = load i32, i32* %data, align 4, !dbg !99
  %cmp = icmp sge i32 %3, 0, !dbg !101
  br i1 %cmp, label %land.lhs.true, label %if.else5, !dbg !102

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !103
  %cmp3 = icmp slt i32 %4, 10, !dbg !104
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !105

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !106
  %idxprom = sext i32 %5 to i64, !dbg !108
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !108
  %6 = load i32, i32* %arrayidx, align 4, !dbg !108
  call void @printIntLine(i32 %6), !dbg !109
  br label %if.end6, !dbg !110

if.else5:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !111
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 -1, i32* %data, align 4, !dbg !117
  %0 = load i32, i32* @staticTrue, align 4, !dbg !118
  %tobool = icmp ne i32 %0, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !121
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !124
  %tobool1 = icmp ne i32 %1, 0, !dbg !124
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !126

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !127, metadata !DIExpression()), !dbg !130
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !130
  %3 = load i32, i32* %data, align 4, !dbg !131
  %cmp = icmp sge i32 %3, 0, !dbg !133
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !134

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !135
  %cmp3 = icmp slt i32 %4, 10, !dbg !136
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !137

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !138
  %idxprom = sext i32 %5 to i64, !dbg !140
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !140
  %6 = load i32, i32* %arrayidx, align 4, !dbg !140
  call void @printIntLine(i32 %6), !dbg !141
  br label %if.end5, !dbg !142

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !143
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !145

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !147 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i32 -1, i32* %data, align 4, !dbg !150
  %0 = load i32, i32* @staticFalse, align 4, !dbg !151
  %tobool = icmp ne i32 %0, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !154
  br label %if.end, !dbg !156

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !157
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !159
  %tobool1 = icmp ne i32 %1, 0, !dbg !159
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !161

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !162, metadata !DIExpression()), !dbg !165
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !165
  %3 = load i32, i32* %data, align 4, !dbg !166
  %cmp = icmp sge i32 %3, 0, !dbg !168
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !169

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !170
  %idxprom = sext i32 %4 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !172
  %5 = load i32, i32* %arrayidx, align 4, !dbg !172
  call void @printIntLine(i32 %5), !dbg !173
  br label %if.end5, !dbg !174

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !175
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !177

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !179 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !180, metadata !DIExpression()), !dbg !181
  store i32 -1, i32* %data, align 4, !dbg !182
  %0 = load i32, i32* @staticTrue, align 4, !dbg !183
  %tobool = icmp ne i32 %0, 0, !dbg !183
  br i1 %tobool, label %if.then, label %if.end, !dbg !185

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !186
  br label %if.end, !dbg !188

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !189
  %tobool1 = icmp ne i32 %1, 0, !dbg !189
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !191

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !192, metadata !DIExpression()), !dbg !195
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !195
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !195
  %3 = load i32, i32* %data, align 4, !dbg !196
  %cmp = icmp sge i32 %3, 0, !dbg !198
  br i1 %cmp, label %if.then3, label %if.else, !dbg !199

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !200
  %idxprom = sext i32 %4 to i64, !dbg !202
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !202
  %5 = load i32, i32* %arrayidx, align 4, !dbg !202
  call void @printIntLine(i32 %5), !dbg !203
  br label %if.end4, !dbg !204

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !205
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !207

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !208
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !11)
!22 = !DILocation(line: 30, column: 9, scope: !18)
!23 = !DILocation(line: 32, column: 10, scope: !18)
!24 = !DILocation(line: 33, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!26 = !DILocation(line: 33, column: 8, scope: !18)
!27 = !DILocation(line: 36, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !10, line: 34, column: 5)
!29 = !DILocation(line: 37, column: 5, scope: !28)
!30 = !DILocation(line: 38, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!32 = !DILocation(line: 38, column: 8, scope: !18)
!33 = !DILocalVariable(name: "buffer", scope: !34, file: !10, line: 41, type: !36)
!34 = distinct !DILexicalBlock(scope: !35, file: !10, line: 40, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 39, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 41, column: 17, scope: !34)
!40 = !DILocation(line: 44, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !10, line: 44, column: 17)
!42 = !DILocation(line: 44, column: 22, scope: !41)
!43 = !DILocation(line: 44, column: 17, scope: !34)
!44 = !DILocation(line: 46, column: 37, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !10, line: 45, column: 13)
!46 = !DILocation(line: 46, column: 30, scope: !45)
!47 = !DILocation(line: 46, column: 17, scope: !45)
!48 = !DILocation(line: 47, column: 13, scope: !45)
!49 = !DILocation(line: 50, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !10, line: 49, column: 13)
!51 = !DILocation(line: 53, column: 5, scope: !35)
!52 = !DILocation(line: 54, column: 1, scope: !18)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_05_good", scope: !10, file: !10, line: 186, type: !19, scopeLine: 187, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 188, column: 5, scope: !53)
!55 = !DILocation(line: 189, column: 5, scope: !53)
!56 = !DILocation(line: 190, column: 5, scope: !53)
!57 = !DILocation(line: 191, column: 5, scope: !53)
!58 = !DILocation(line: 192, column: 1, scope: !53)
!59 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 203, type: !60, scopeLine: 204, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!11, !11, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !10, line: 203, type: !11)
!66 = !DILocation(line: 203, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !10, line: 203, type: !62)
!68 = !DILocation(line: 203, column: 27, scope: !59)
!69 = !DILocation(line: 206, column: 22, scope: !59)
!70 = !DILocation(line: 206, column: 12, scope: !59)
!71 = !DILocation(line: 206, column: 5, scope: !59)
!72 = !DILocation(line: 208, column: 5, scope: !59)
!73 = !DILocation(line: 209, column: 5, scope: !59)
!74 = !DILocation(line: 210, column: 5, scope: !59)
!75 = !DILocation(line: 213, column: 5, scope: !59)
!76 = !DILocation(line: 214, column: 5, scope: !59)
!77 = !DILocation(line: 215, column: 5, scope: !59)
!78 = !DILocation(line: 217, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !10, line: 63, type: !11)
!81 = !DILocation(line: 63, column: 9, scope: !79)
!82 = !DILocation(line: 65, column: 10, scope: !79)
!83 = !DILocation(line: 66, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !10, line: 66, column: 8)
!85 = !DILocation(line: 66, column: 8, scope: !79)
!86 = !DILocation(line: 69, column: 14, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 67, column: 5)
!88 = !DILocation(line: 70, column: 5, scope: !87)
!89 = !DILocation(line: 71, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !79, file: !10, line: 71, column: 8)
!91 = !DILocation(line: 71, column: 8, scope: !79)
!92 = !DILocation(line: 74, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !10, line: 72, column: 5)
!94 = !DILocation(line: 75, column: 5, scope: !93)
!95 = !DILocalVariable(name: "buffer", scope: !96, file: !10, line: 79, type: !36)
!96 = distinct !DILexicalBlock(scope: !97, file: !10, line: 78, column: 9)
!97 = distinct !DILexicalBlock(scope: !90, file: !10, line: 77, column: 5)
!98 = !DILocation(line: 79, column: 17, scope: !96)
!99 = !DILocation(line: 81, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !10, line: 81, column: 17)
!101 = !DILocation(line: 81, column: 22, scope: !100)
!102 = !DILocation(line: 81, column: 27, scope: !100)
!103 = !DILocation(line: 81, column: 30, scope: !100)
!104 = !DILocation(line: 81, column: 35, scope: !100)
!105 = !DILocation(line: 81, column: 17, scope: !96)
!106 = !DILocation(line: 83, column: 37, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !10, line: 82, column: 13)
!108 = !DILocation(line: 83, column: 30, scope: !107)
!109 = !DILocation(line: 83, column: 17, scope: !107)
!110 = !DILocation(line: 84, column: 13, scope: !107)
!111 = !DILocation(line: 87, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !100, file: !10, line: 86, column: 13)
!113 = !DILocation(line: 91, column: 1, scope: !79)
!114 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !10, line: 96, type: !11)
!116 = !DILocation(line: 96, column: 9, scope: !114)
!117 = !DILocation(line: 98, column: 10, scope: !114)
!118 = !DILocation(line: 99, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !10, line: 99, column: 8)
!120 = !DILocation(line: 99, column: 8, scope: !114)
!121 = !DILocation(line: 102, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !10, line: 100, column: 5)
!123 = !DILocation(line: 103, column: 5, scope: !122)
!124 = !DILocation(line: 104, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !114, file: !10, line: 104, column: 8)
!126 = !DILocation(line: 104, column: 8, scope: !114)
!127 = !DILocalVariable(name: "buffer", scope: !128, file: !10, line: 107, type: !36)
!128 = distinct !DILexicalBlock(scope: !129, file: !10, line: 106, column: 9)
!129 = distinct !DILexicalBlock(scope: !125, file: !10, line: 105, column: 5)
!130 = !DILocation(line: 107, column: 17, scope: !128)
!131 = !DILocation(line: 109, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !10, line: 109, column: 17)
!133 = !DILocation(line: 109, column: 22, scope: !132)
!134 = !DILocation(line: 109, column: 27, scope: !132)
!135 = !DILocation(line: 109, column: 30, scope: !132)
!136 = !DILocation(line: 109, column: 35, scope: !132)
!137 = !DILocation(line: 109, column: 17, scope: !128)
!138 = !DILocation(line: 111, column: 37, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !10, line: 110, column: 13)
!140 = !DILocation(line: 111, column: 30, scope: !139)
!141 = !DILocation(line: 111, column: 17, scope: !139)
!142 = !DILocation(line: 112, column: 13, scope: !139)
!143 = !DILocation(line: 115, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !132, file: !10, line: 114, column: 13)
!145 = !DILocation(line: 118, column: 5, scope: !129)
!146 = !DILocation(line: 119, column: 1, scope: !114)
!147 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 122, type: !19, scopeLine: 123, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !10, line: 124, type: !11)
!149 = !DILocation(line: 124, column: 9, scope: !147)
!150 = !DILocation(line: 126, column: 10, scope: !147)
!151 = !DILocation(line: 127, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !10, line: 127, column: 8)
!153 = !DILocation(line: 127, column: 8, scope: !147)
!154 = !DILocation(line: 130, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !10, line: 128, column: 5)
!156 = !DILocation(line: 131, column: 5, scope: !155)
!157 = !DILocation(line: 136, column: 14, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !10, line: 133, column: 5)
!159 = !DILocation(line: 138, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !147, file: !10, line: 138, column: 8)
!161 = !DILocation(line: 138, column: 8, scope: !147)
!162 = !DILocalVariable(name: "buffer", scope: !163, file: !10, line: 141, type: !36)
!163 = distinct !DILexicalBlock(scope: !164, file: !10, line: 140, column: 9)
!164 = distinct !DILexicalBlock(scope: !160, file: !10, line: 139, column: 5)
!165 = !DILocation(line: 141, column: 17, scope: !163)
!166 = !DILocation(line: 144, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !10, line: 144, column: 17)
!168 = !DILocation(line: 144, column: 22, scope: !167)
!169 = !DILocation(line: 144, column: 17, scope: !163)
!170 = !DILocation(line: 146, column: 37, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !10, line: 145, column: 13)
!172 = !DILocation(line: 146, column: 30, scope: !171)
!173 = !DILocation(line: 146, column: 17, scope: !171)
!174 = !DILocation(line: 147, column: 13, scope: !171)
!175 = !DILocation(line: 150, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !167, file: !10, line: 149, column: 13)
!177 = !DILocation(line: 153, column: 5, scope: !164)
!178 = !DILocation(line: 154, column: 1, scope: !147)
!179 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 157, type: !19, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!180 = !DILocalVariable(name: "data", scope: !179, file: !10, line: 159, type: !11)
!181 = !DILocation(line: 159, column: 9, scope: !179)
!182 = !DILocation(line: 161, column: 10, scope: !179)
!183 = !DILocation(line: 162, column: 8, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !10, line: 162, column: 8)
!185 = !DILocation(line: 162, column: 8, scope: !179)
!186 = !DILocation(line: 166, column: 14, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !10, line: 163, column: 5)
!188 = !DILocation(line: 167, column: 5, scope: !187)
!189 = !DILocation(line: 168, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !179, file: !10, line: 168, column: 8)
!191 = !DILocation(line: 168, column: 8, scope: !179)
!192 = !DILocalVariable(name: "buffer", scope: !193, file: !10, line: 171, type: !36)
!193 = distinct !DILexicalBlock(scope: !194, file: !10, line: 170, column: 9)
!194 = distinct !DILexicalBlock(scope: !190, file: !10, line: 169, column: 5)
!195 = !DILocation(line: 171, column: 17, scope: !193)
!196 = !DILocation(line: 174, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !10, line: 174, column: 17)
!198 = !DILocation(line: 174, column: 22, scope: !197)
!199 = !DILocation(line: 174, column: 17, scope: !193)
!200 = !DILocation(line: 176, column: 37, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !10, line: 175, column: 13)
!202 = !DILocation(line: 176, column: 30, scope: !201)
!203 = !DILocation(line: 176, column: 17, scope: !201)
!204 = !DILocation(line: 177, column: 13, scope: !201)
!205 = !DILocation(line: 180, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !197, file: !10, line: 179, column: 13)
!207 = !DILocation(line: 183, column: 5, scope: !194)
!208 = !DILocation(line: 184, column: 1, scope: !179)
