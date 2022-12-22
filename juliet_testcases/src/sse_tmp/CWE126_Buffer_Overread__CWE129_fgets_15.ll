; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_15_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !26
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !27
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !30
  %cmp = icmp ne i8* %call, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !35
  store i32 %call2, i32* %data, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !45
  %3 = load i32, i32* %data, align 4, !dbg !46
  %cmp3 = icmp sge i32 %3, 0, !dbg !48
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !49

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !50
  %idxprom = sext i32 %4 to i64, !dbg !52
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !52
  %5 = load i32, i32* %arrayidx, align 4, !dbg !52
  call void @printIntLine(i32 %5), !dbg !53
  br label %if.end6, !dbg !54

if.else5:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_15_good() #0 !dbg !58 {
entry:
  call void @goodB2G1(), !dbg !59
  call void @goodB2G2(), !dbg !60
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #7, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #7, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE129_fgets_15_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__CWE129_fgets_15_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 -1, i32* %data, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !87, metadata !DIExpression()), !dbg !89
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !89
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !90
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !92
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !93
  %cmp = icmp ne i8* %call, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !98
  store i32 %call2, i32* %data, align 4, !dbg !99
  br label %if.end, !dbg !100

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !103, metadata !DIExpression()), !dbg !105
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !105
  %3 = load i32, i32* %data, align 4, !dbg !106
  %cmp3 = icmp sge i32 %3, 0, !dbg !108
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !109

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !110
  %cmp4 = icmp slt i32 %4, 10, !dbg !111
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !112

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !113
  %idxprom = sext i32 %5 to i64, !dbg !115
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !115
  %6 = load i32, i32* %arrayidx, align 4, !dbg !115
  call void @printIntLine(i32 %6), !dbg !116
  br label %if.end7, !dbg !117

if.else6:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !118
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !121 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32 -1, i32* %data, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !125, metadata !DIExpression()), !dbg !127
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !128
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !130
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !131
  %cmp = icmp ne i8* %call, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.else, !dbg !133

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !134
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !136
  store i32 %call2, i32* %data, align 4, !dbg !137
  br label %if.end, !dbg !138

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !141, metadata !DIExpression()), !dbg !143
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !143
  %3 = load i32, i32* %data, align 4, !dbg !144
  %cmp3 = icmp sge i32 %3, 0, !dbg !146
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !147

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !148
  %cmp4 = icmp slt i32 %4, 10, !dbg !149
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !150

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !151
  %idxprom = sext i32 %5 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !153
  %6 = load i32, i32* %arrayidx, align 4, !dbg !153
  call void @printIntLine(i32 %6), !dbg !154
  br label %if.end7, !dbg !155

if.else6:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !156
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !159 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !160, metadata !DIExpression()), !dbg !161
  store i32 -1, i32* %data, align 4, !dbg !162
  store i32 7, i32* %data, align 4, !dbg !163
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !164, metadata !DIExpression()), !dbg !166
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !166
  %1 = load i32, i32* %data, align 4, !dbg !167
  %cmp = icmp sge i32 %1, 0, !dbg !169
  br i1 %cmp, label %if.then, label %if.else, !dbg !170

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !171
  %idxprom = sext i32 %2 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !173
  %3 = load i32, i32* %arrayidx, align 4, !dbg !173
  call void @printIntLine(i32 %3), !dbg !174
  br label %if.end, !dbg !175

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !176
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !179 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !180, metadata !DIExpression()), !dbg !181
  store i32 -1, i32* %data, align 4, !dbg !182
  store i32 7, i32* %data, align 4, !dbg !183
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !184, metadata !DIExpression()), !dbg !186
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !186
  %1 = load i32, i32* %data, align 4, !dbg !187
  %cmp = icmp sge i32 %1, 0, !dbg !189
  br i1 %cmp, label %if.then, label %if.else, !dbg !190

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !191
  %idxprom = sext i32 %2 to i64, !dbg !193
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !193
  %3 = load i32, i32* %arrayidx, align 4, !dbg !193
  call void @printIntLine(i32 %3), !dbg !194
  br label %if.end, !dbg !195

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !196
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !198
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_15_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_15.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 33, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 33, column: 14, scope: !21)
!27 = !DILocation(line: 35, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 35, column: 13)
!29 = !DILocation(line: 35, column: 49, scope: !28)
!30 = !DILocation(line: 35, column: 13, scope: !28)
!31 = !DILocation(line: 35, column: 56, scope: !28)
!32 = !DILocation(line: 35, column: 13, scope: !21)
!33 = !DILocation(line: 38, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 36, column: 9)
!35 = !DILocation(line: 38, column: 20, scope: !34)
!36 = !DILocation(line: 38, column: 18, scope: !34)
!37 = !DILocation(line: 39, column: 9, scope: !34)
!38 = !DILocation(line: 42, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 41, column: 9)
!40 = !DILocalVariable(name: "buffer", scope: !41, file: !13, line: 55, type: !42)
!41 = distinct !DILexicalBlock(scope: !12, file: !13, line: 54, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 10)
!45 = !DILocation(line: 55, column: 13, scope: !41)
!46 = !DILocation(line: 58, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !13, line: 58, column: 13)
!48 = !DILocation(line: 58, column: 18, scope: !47)
!49 = !DILocation(line: 58, column: 13, scope: !41)
!50 = !DILocation(line: 60, column: 33, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !13, line: 59, column: 9)
!52 = !DILocation(line: 60, column: 26, scope: !51)
!53 = !DILocation(line: 60, column: 13, scope: !51)
!54 = !DILocation(line: 61, column: 9, scope: !51)
!55 = !DILocation(line: 64, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !47, file: !13, line: 63, column: 9)
!57 = !DILocation(line: 73, column: 1, scope: !12)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_15_good", scope: !13, file: !13, line: 265, type: !14, scopeLine: 266, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 267, column: 5, scope: !58)
!60 = !DILocation(line: 268, column: 5, scope: !58)
!61 = !DILocation(line: 269, column: 5, scope: !58)
!62 = !DILocation(line: 270, column: 5, scope: !58)
!63 = !DILocation(line: 271, column: 1, scope: !58)
!64 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 282, type: !65, scopeLine: 283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!17, !17, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !13, line: 282, type: !17)
!70 = !DILocation(line: 282, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !13, line: 282, type: !67)
!72 = !DILocation(line: 282, column: 27, scope: !64)
!73 = !DILocation(line: 285, column: 22, scope: !64)
!74 = !DILocation(line: 285, column: 12, scope: !64)
!75 = !DILocation(line: 285, column: 5, scope: !64)
!76 = !DILocation(line: 287, column: 5, scope: !64)
!77 = !DILocation(line: 288, column: 5, scope: !64)
!78 = !DILocation(line: 289, column: 5, scope: !64)
!79 = !DILocation(line: 292, column: 5, scope: !64)
!80 = !DILocation(line: 293, column: 5, scope: !64)
!81 = !DILocation(line: 294, column: 5, scope: !64)
!82 = !DILocation(line: 296, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 80, type: !14, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !13, line: 82, type: !17)
!85 = !DILocation(line: 82, column: 9, scope: !83)
!86 = !DILocation(line: 84, column: 10, scope: !83)
!87 = !DILocalVariable(name: "inputBuffer", scope: !88, file: !13, line: 89, type: !22)
!88 = distinct !DILexicalBlock(scope: !83, file: !13, line: 88, column: 5)
!89 = !DILocation(line: 89, column: 14, scope: !88)
!90 = !DILocation(line: 91, column: 19, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !13, line: 91, column: 13)
!92 = !DILocation(line: 91, column: 49, scope: !91)
!93 = !DILocation(line: 91, column: 13, scope: !91)
!94 = !DILocation(line: 91, column: 56, scope: !91)
!95 = !DILocation(line: 91, column: 13, scope: !88)
!96 = !DILocation(line: 94, column: 25, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !13, line: 92, column: 9)
!98 = !DILocation(line: 94, column: 20, scope: !97)
!99 = !DILocation(line: 94, column: 18, scope: !97)
!100 = !DILocation(line: 95, column: 9, scope: !97)
!101 = !DILocation(line: 98, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !91, file: !13, line: 97, column: 9)
!103 = !DILocalVariable(name: "buffer", scope: !104, file: !13, line: 115, type: !42)
!104 = distinct !DILexicalBlock(scope: !83, file: !13, line: 114, column: 5)
!105 = !DILocation(line: 115, column: 13, scope: !104)
!106 = !DILocation(line: 117, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !13, line: 117, column: 13)
!108 = !DILocation(line: 117, column: 18, scope: !107)
!109 = !DILocation(line: 117, column: 23, scope: !107)
!110 = !DILocation(line: 117, column: 26, scope: !107)
!111 = !DILocation(line: 117, column: 31, scope: !107)
!112 = !DILocation(line: 117, column: 13, scope: !104)
!113 = !DILocation(line: 119, column: 33, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !13, line: 118, column: 9)
!115 = !DILocation(line: 119, column: 26, scope: !114)
!116 = !DILocation(line: 119, column: 13, scope: !114)
!117 = !DILocation(line: 120, column: 9, scope: !114)
!118 = !DILocation(line: 123, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !13, line: 122, column: 9)
!120 = !DILocation(line: 128, column: 1, scope: !83)
!121 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 131, type: !14, scopeLine: 132, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !13, line: 133, type: !17)
!123 = !DILocation(line: 133, column: 9, scope: !121)
!124 = !DILocation(line: 135, column: 10, scope: !121)
!125 = !DILocalVariable(name: "inputBuffer", scope: !126, file: !13, line: 140, type: !22)
!126 = distinct !DILexicalBlock(scope: !121, file: !13, line: 139, column: 5)
!127 = !DILocation(line: 140, column: 14, scope: !126)
!128 = !DILocation(line: 142, column: 19, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !13, line: 142, column: 13)
!130 = !DILocation(line: 142, column: 49, scope: !129)
!131 = !DILocation(line: 142, column: 13, scope: !129)
!132 = !DILocation(line: 142, column: 56, scope: !129)
!133 = !DILocation(line: 142, column: 13, scope: !126)
!134 = !DILocation(line: 145, column: 25, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !13, line: 143, column: 9)
!136 = !DILocation(line: 145, column: 20, scope: !135)
!137 = !DILocation(line: 145, column: 18, scope: !135)
!138 = !DILocation(line: 146, column: 9, scope: !135)
!139 = !DILocation(line: 149, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !129, file: !13, line: 148, column: 9)
!141 = !DILocalVariable(name: "buffer", scope: !142, file: !13, line: 162, type: !42)
!142 = distinct !DILexicalBlock(scope: !121, file: !13, line: 161, column: 5)
!143 = !DILocation(line: 162, column: 13, scope: !142)
!144 = !DILocation(line: 164, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !13, line: 164, column: 13)
!146 = !DILocation(line: 164, column: 18, scope: !145)
!147 = !DILocation(line: 164, column: 23, scope: !145)
!148 = !DILocation(line: 164, column: 26, scope: !145)
!149 = !DILocation(line: 164, column: 31, scope: !145)
!150 = !DILocation(line: 164, column: 13, scope: !142)
!151 = !DILocation(line: 166, column: 33, scope: !152)
!152 = distinct !DILexicalBlock(scope: !145, file: !13, line: 165, column: 9)
!153 = !DILocation(line: 166, column: 26, scope: !152)
!154 = !DILocation(line: 166, column: 13, scope: !152)
!155 = !DILocation(line: 167, column: 9, scope: !152)
!156 = !DILocation(line: 170, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !145, file: !13, line: 169, column: 9)
!158 = !DILocation(line: 179, column: 1, scope: !121)
!159 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 182, type: !14, scopeLine: 183, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocalVariable(name: "data", scope: !159, file: !13, line: 184, type: !17)
!161 = !DILocation(line: 184, column: 9, scope: !159)
!162 = !DILocation(line: 186, column: 10, scope: !159)
!163 = !DILocation(line: 196, column: 14, scope: !159)
!164 = !DILocalVariable(name: "buffer", scope: !165, file: !13, line: 203, type: !42)
!165 = distinct !DILexicalBlock(scope: !159, file: !13, line: 202, column: 5)
!166 = !DILocation(line: 203, column: 13, scope: !165)
!167 = !DILocation(line: 206, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !13, line: 206, column: 13)
!169 = !DILocation(line: 206, column: 18, scope: !168)
!170 = !DILocation(line: 206, column: 13, scope: !165)
!171 = !DILocation(line: 208, column: 33, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !13, line: 207, column: 9)
!173 = !DILocation(line: 208, column: 26, scope: !172)
!174 = !DILocation(line: 208, column: 13, scope: !172)
!175 = !DILocation(line: 209, column: 9, scope: !172)
!176 = !DILocation(line: 212, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !168, file: !13, line: 211, column: 9)
!178 = !DILocation(line: 221, column: 1, scope: !159)
!179 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 224, type: !14, scopeLine: 225, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DILocalVariable(name: "data", scope: !179, file: !13, line: 226, type: !17)
!181 = !DILocation(line: 226, column: 9, scope: !179)
!182 = !DILocation(line: 228, column: 10, scope: !179)
!183 = !DILocation(line: 234, column: 14, scope: !179)
!184 = !DILocalVariable(name: "buffer", scope: !185, file: !13, line: 245, type: !42)
!185 = distinct !DILexicalBlock(scope: !179, file: !13, line: 244, column: 5)
!186 = !DILocation(line: 245, column: 13, scope: !185)
!187 = !DILocation(line: 248, column: 13, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !13, line: 248, column: 13)
!189 = !DILocation(line: 248, column: 18, scope: !188)
!190 = !DILocation(line: 248, column: 13, scope: !185)
!191 = !DILocation(line: 250, column: 33, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !13, line: 249, column: 9)
!193 = !DILocation(line: 250, column: 26, scope: !192)
!194 = !DILocation(line: 250, column: 13, scope: !192)
!195 = !DILocation(line: 251, column: 9, scope: !192)
!196 = !DILocation(line: 254, column: 13, scope: !197)
!197 = distinct !DILexicalBlock(scope: !188, file: !13, line: 253, column: 9)
!198 = !DILocation(line: 263, column: 1, scope: !179)
