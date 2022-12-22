; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %0 = load i32, i32* @staticTrue, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !27
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool1 = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !33

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !34, metadata !DIExpression()), !dbg !40
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !40
  %4 = load i32, i32* %data, align 4, !dbg !41
  %cmp = icmp sge i32 %4, 0, !dbg !43
  br i1 %cmp, label %if.then3, label %if.else, !dbg !44

if.then3:                                         ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !45
  %idxprom = sext i32 %5 to i64, !dbg !47
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !47
  %6 = load i32, i32* %arrayidx, align 4, !dbg !47
  call void @printIntLine(i32 %6), !dbg !48
  br label %if.end4, !dbg !49

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !52

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_05_good() #0 !dbg !54 {
entry:
  call void @goodB2G1(), !dbg !55
  call void @goodB2G2(), !dbg !56
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE129_fscanf_05_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE129_fscanf_05_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !80 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  %0 = load i32, i32* @staticTrue, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !87
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !89
  br label %if.end, !dbg !90

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool1 = icmp ne i32 %2, 0, !dbg !91
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !94
  br label %if.end7, !dbg !96

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !97, metadata !DIExpression()), !dbg !100
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !100
  %4 = load i32, i32* %data, align 4, !dbg !101
  %cmp = icmp sge i32 %4, 0, !dbg !103
  br i1 %cmp, label %land.lhs.true, label %if.else5, !dbg !104

land.lhs.true:                                    ; preds = %if.else
  %5 = load i32, i32* %data, align 4, !dbg !105
  %cmp3 = icmp slt i32 %5, 10, !dbg !106
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !107

if.then4:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !108
  %idxprom = sext i32 %6 to i64, !dbg !110
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !110
  %7 = load i32, i32* %arrayidx, align 4, !dbg !110
  call void @printIntLine(i32 %7), !dbg !111
  br label %if.end6, !dbg !112

if.else5:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !113
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !116 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  %0 = load i32, i32* @staticTrue, align 4, !dbg !120
  %tobool = icmp ne i32 %0, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !123
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !127
  %tobool1 = icmp ne i32 %2, 0, !dbg !127
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !129

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !130, metadata !DIExpression()), !dbg !133
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !133
  %4 = load i32, i32* %data, align 4, !dbg !134
  %cmp = icmp sge i32 %4, 0, !dbg !136
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !137

land.lhs.true:                                    ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !138
  %cmp3 = icmp slt i32 %5, 10, !dbg !139
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !140

if.then4:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !141
  %idxprom = sext i32 %6 to i64, !dbg !143
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !143
  %7 = load i32, i32* %arrayidx, align 4, !dbg !143
  call void @printIntLine(i32 %7), !dbg !144
  br label %if.end5, !dbg !145

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !146
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !148

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !150 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 -1, i32* %data, align 4, !dbg !153
  %0 = load i32, i32* @staticFalse, align 4, !dbg !154
  %tobool = icmp ne i32 %0, 0, !dbg !154
  br i1 %tobool, label %if.then, label %if.else, !dbg !156

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !157
  br label %if.end, !dbg !159

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !160
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !162
  %tobool1 = icmp ne i32 %1, 0, !dbg !162
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !164

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !165, metadata !DIExpression()), !dbg !168
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !168
  %3 = load i32, i32* %data, align 4, !dbg !169
  %cmp = icmp sge i32 %3, 0, !dbg !171
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !172

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !173
  %idxprom = sext i32 %4 to i64, !dbg !175
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !175
  %5 = load i32, i32* %arrayidx, align 4, !dbg !175
  call void @printIntLine(i32 %5), !dbg !176
  br label %if.end5, !dbg !177

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !178
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !180

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !182 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !183, metadata !DIExpression()), !dbg !184
  store i32 -1, i32* %data, align 4, !dbg !185
  %0 = load i32, i32* @staticTrue, align 4, !dbg !186
  %tobool = icmp ne i32 %0, 0, !dbg !186
  br i1 %tobool, label %if.then, label %if.end, !dbg !188

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !189
  br label %if.end, !dbg !191

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !192
  %tobool1 = icmp ne i32 %1, 0, !dbg !192
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !194

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !195, metadata !DIExpression()), !dbg !198
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !198
  %3 = load i32, i32* %data, align 4, !dbg !199
  %cmp = icmp sge i32 %3, 0, !dbg !201
  br i1 %cmp, label %if.then3, label %if.else, !dbg !202

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !203
  %idxprom = sext i32 %4 to i64, !dbg !205
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !205
  %5 = load i32, i32* %arrayidx, align 4, !dbg !205
  call void @printIntLine(i32 %5), !dbg !206
  br label %if.end4, !dbg !207

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !208
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !210

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !211
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !11)
!22 = !DILocation(line: 30, column: 9, scope: !18)
!23 = !DILocation(line: 32, column: 10, scope: !18)
!24 = !DILocation(line: 33, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!26 = !DILocation(line: 33, column: 8, scope: !18)
!27 = !DILocation(line: 36, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !10, line: 34, column: 5)
!29 = !DILocation(line: 36, column: 9, scope: !28)
!30 = !DILocation(line: 37, column: 5, scope: !28)
!31 = !DILocation(line: 38, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!33 = !DILocation(line: 38, column: 8, scope: !18)
!34 = !DILocalVariable(name: "buffer", scope: !35, file: !10, line: 41, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !10, line: 40, column: 9)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 39, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 41, column: 17, scope: !35)
!41 = !DILocation(line: 44, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !10, line: 44, column: 17)
!43 = !DILocation(line: 44, column: 22, scope: !42)
!44 = !DILocation(line: 44, column: 17, scope: !35)
!45 = !DILocation(line: 46, column: 37, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !10, line: 45, column: 13)
!47 = !DILocation(line: 46, column: 30, scope: !46)
!48 = !DILocation(line: 46, column: 17, scope: !46)
!49 = !DILocation(line: 47, column: 13, scope: !46)
!50 = !DILocation(line: 50, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !42, file: !10, line: 49, column: 13)
!52 = !DILocation(line: 53, column: 5, scope: !36)
!53 = !DILocation(line: 54, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_05_good", scope: !10, file: !10, line: 186, type: !19, scopeLine: 187, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 188, column: 5, scope: !54)
!56 = !DILocation(line: 189, column: 5, scope: !54)
!57 = !DILocation(line: 190, column: 5, scope: !54)
!58 = !DILocation(line: 191, column: 5, scope: !54)
!59 = !DILocation(line: 192, column: 1, scope: !54)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 203, type: !61, scopeLine: 204, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !10, line: 203, type: !11)
!67 = !DILocation(line: 203, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !10, line: 203, type: !63)
!69 = !DILocation(line: 203, column: 27, scope: !60)
!70 = !DILocation(line: 206, column: 22, scope: !60)
!71 = !DILocation(line: 206, column: 12, scope: !60)
!72 = !DILocation(line: 206, column: 5, scope: !60)
!73 = !DILocation(line: 208, column: 5, scope: !60)
!74 = !DILocation(line: 209, column: 5, scope: !60)
!75 = !DILocation(line: 210, column: 5, scope: !60)
!76 = !DILocation(line: 213, column: 5, scope: !60)
!77 = !DILocation(line: 214, column: 5, scope: !60)
!78 = !DILocation(line: 215, column: 5, scope: !60)
!79 = !DILocation(line: 217, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 63, type: !11)
!82 = !DILocation(line: 63, column: 9, scope: !80)
!83 = !DILocation(line: 65, column: 10, scope: !80)
!84 = !DILocation(line: 66, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !10, line: 66, column: 8)
!86 = !DILocation(line: 66, column: 8, scope: !80)
!87 = !DILocation(line: 69, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 67, column: 5)
!89 = !DILocation(line: 69, column: 9, scope: !88)
!90 = !DILocation(line: 70, column: 5, scope: !88)
!91 = !DILocation(line: 71, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !80, file: !10, line: 71, column: 8)
!93 = !DILocation(line: 71, column: 8, scope: !80)
!94 = !DILocation(line: 74, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !10, line: 72, column: 5)
!96 = !DILocation(line: 75, column: 5, scope: !95)
!97 = !DILocalVariable(name: "buffer", scope: !98, file: !10, line: 79, type: !37)
!98 = distinct !DILexicalBlock(scope: !99, file: !10, line: 78, column: 9)
!99 = distinct !DILexicalBlock(scope: !92, file: !10, line: 77, column: 5)
!100 = !DILocation(line: 79, column: 17, scope: !98)
!101 = !DILocation(line: 81, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !10, line: 81, column: 17)
!103 = !DILocation(line: 81, column: 22, scope: !102)
!104 = !DILocation(line: 81, column: 27, scope: !102)
!105 = !DILocation(line: 81, column: 30, scope: !102)
!106 = !DILocation(line: 81, column: 35, scope: !102)
!107 = !DILocation(line: 81, column: 17, scope: !98)
!108 = !DILocation(line: 83, column: 37, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !10, line: 82, column: 13)
!110 = !DILocation(line: 83, column: 30, scope: !109)
!111 = !DILocation(line: 83, column: 17, scope: !109)
!112 = !DILocation(line: 84, column: 13, scope: !109)
!113 = !DILocation(line: 87, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !10, line: 86, column: 13)
!115 = !DILocation(line: 91, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !10, line: 96, type: !11)
!118 = !DILocation(line: 96, column: 9, scope: !116)
!119 = !DILocation(line: 98, column: 10, scope: !116)
!120 = !DILocation(line: 99, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !10, line: 99, column: 8)
!122 = !DILocation(line: 99, column: 8, scope: !116)
!123 = !DILocation(line: 102, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 100, column: 5)
!125 = !DILocation(line: 102, column: 9, scope: !124)
!126 = !DILocation(line: 103, column: 5, scope: !124)
!127 = !DILocation(line: 104, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !10, line: 104, column: 8)
!129 = !DILocation(line: 104, column: 8, scope: !116)
!130 = !DILocalVariable(name: "buffer", scope: !131, file: !10, line: 107, type: !37)
!131 = distinct !DILexicalBlock(scope: !132, file: !10, line: 106, column: 9)
!132 = distinct !DILexicalBlock(scope: !128, file: !10, line: 105, column: 5)
!133 = !DILocation(line: 107, column: 17, scope: !131)
!134 = !DILocation(line: 109, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !10, line: 109, column: 17)
!136 = !DILocation(line: 109, column: 22, scope: !135)
!137 = !DILocation(line: 109, column: 27, scope: !135)
!138 = !DILocation(line: 109, column: 30, scope: !135)
!139 = !DILocation(line: 109, column: 35, scope: !135)
!140 = !DILocation(line: 109, column: 17, scope: !131)
!141 = !DILocation(line: 111, column: 37, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !10, line: 110, column: 13)
!143 = !DILocation(line: 111, column: 30, scope: !142)
!144 = !DILocation(line: 111, column: 17, scope: !142)
!145 = !DILocation(line: 112, column: 13, scope: !142)
!146 = !DILocation(line: 115, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !135, file: !10, line: 114, column: 13)
!148 = !DILocation(line: 118, column: 5, scope: !132)
!149 = !DILocation(line: 119, column: 1, scope: !116)
!150 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 122, type: !19, scopeLine: 123, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", scope: !150, file: !10, line: 124, type: !11)
!152 = !DILocation(line: 124, column: 9, scope: !150)
!153 = !DILocation(line: 126, column: 10, scope: !150)
!154 = !DILocation(line: 127, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !10, line: 127, column: 8)
!156 = !DILocation(line: 127, column: 8, scope: !150)
!157 = !DILocation(line: 130, column: 9, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !10, line: 128, column: 5)
!159 = !DILocation(line: 131, column: 5, scope: !158)
!160 = !DILocation(line: 136, column: 14, scope: !161)
!161 = distinct !DILexicalBlock(scope: !155, file: !10, line: 133, column: 5)
!162 = !DILocation(line: 138, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !150, file: !10, line: 138, column: 8)
!164 = !DILocation(line: 138, column: 8, scope: !150)
!165 = !DILocalVariable(name: "buffer", scope: !166, file: !10, line: 141, type: !37)
!166 = distinct !DILexicalBlock(scope: !167, file: !10, line: 140, column: 9)
!167 = distinct !DILexicalBlock(scope: !163, file: !10, line: 139, column: 5)
!168 = !DILocation(line: 141, column: 17, scope: !166)
!169 = !DILocation(line: 144, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !10, line: 144, column: 17)
!171 = !DILocation(line: 144, column: 22, scope: !170)
!172 = !DILocation(line: 144, column: 17, scope: !166)
!173 = !DILocation(line: 146, column: 37, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !10, line: 145, column: 13)
!175 = !DILocation(line: 146, column: 30, scope: !174)
!176 = !DILocation(line: 146, column: 17, scope: !174)
!177 = !DILocation(line: 147, column: 13, scope: !174)
!178 = !DILocation(line: 150, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !170, file: !10, line: 149, column: 13)
!180 = !DILocation(line: 153, column: 5, scope: !167)
!181 = !DILocation(line: 154, column: 1, scope: !150)
!182 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 157, type: !19, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!183 = !DILocalVariable(name: "data", scope: !182, file: !10, line: 159, type: !11)
!184 = !DILocation(line: 159, column: 9, scope: !182)
!185 = !DILocation(line: 161, column: 10, scope: !182)
!186 = !DILocation(line: 162, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !10, line: 162, column: 8)
!188 = !DILocation(line: 162, column: 8, scope: !182)
!189 = !DILocation(line: 166, column: 14, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !10, line: 163, column: 5)
!191 = !DILocation(line: 167, column: 5, scope: !190)
!192 = !DILocation(line: 168, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !182, file: !10, line: 168, column: 8)
!194 = !DILocation(line: 168, column: 8, scope: !182)
!195 = !DILocalVariable(name: "buffer", scope: !196, file: !10, line: 171, type: !37)
!196 = distinct !DILexicalBlock(scope: !197, file: !10, line: 170, column: 9)
!197 = distinct !DILexicalBlock(scope: !193, file: !10, line: 169, column: 5)
!198 = !DILocation(line: 171, column: 17, scope: !196)
!199 = !DILocation(line: 174, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !10, line: 174, column: 17)
!201 = !DILocation(line: 174, column: 22, scope: !200)
!202 = !DILocation(line: 174, column: 17, scope: !196)
!203 = !DILocation(line: 176, column: 37, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !10, line: 175, column: 13)
!205 = !DILocation(line: 176, column: 30, scope: !204)
!206 = !DILocation(line: 176, column: 17, scope: !204)
!207 = !DILocation(line: 177, column: 13, scope: !204)
!208 = !DILocation(line: 180, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !200, file: !10, line: 179, column: 13)
!210 = !DILocation(line: 183, column: 5, scope: !197)
!211 = !DILocation(line: 184, column: 1, scope: !182)
