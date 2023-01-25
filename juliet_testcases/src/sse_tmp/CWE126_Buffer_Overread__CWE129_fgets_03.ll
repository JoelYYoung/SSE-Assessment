; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_03.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_03_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !28
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !28
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !29
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !31
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !32
  %cmp = icmp ne i8* %call, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !37
  store i32 %call2, i32* %data, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !42, metadata !DIExpression()), !dbg !49
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !49
  %3 = load i32, i32* %data, align 4, !dbg !50
  %cmp3 = icmp sge i32 %3, 0, !dbg !52
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !53

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !54
  %idxprom = sext i32 %4 to i64, !dbg !56
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !56
  %5 = load i32, i32* %arrayidx, align 4, !dbg !56
  call void @printIntLine(i32 %5), !dbg !57
  br label %if.end6, !dbg !58

if.else5:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  ret void, !dbg !61
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_03_good() #0 !dbg !62 {
entry:
  call void @goodB2G1(), !dbg !63
  call void @goodB2G2(), !dbg !64
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__CWE129_fgets_03_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__CWE129_fgets_03_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %data, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !91, metadata !DIExpression()), !dbg !95
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !98
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !99
  %cmp = icmp ne i8* %call, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !102
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !104
  store i32 %call2, i32* %data, align 4, !dbg !105
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !109, metadata !DIExpression()), !dbg !113
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !113
  %3 = load i32, i32* %data, align 4, !dbg !114
  %cmp3 = icmp sge i32 %3, 0, !dbg !116
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !117

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !118
  %cmp4 = icmp slt i32 %4, 10, !dbg !119
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !120

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !121
  %idxprom = sext i32 %5 to i64, !dbg !123
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !123
  %6 = load i32, i32* %arrayidx, align 4, !dbg !123
  call void @printIntLine(i32 %6), !dbg !124
  br label %if.end7, !dbg !125

if.else6:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !126
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !129 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32 -1, i32* %data, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !133, metadata !DIExpression()), !dbg !137
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !137
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !140
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !141
  %cmp = icmp ne i8* %call, null, !dbg !142
  br i1 %cmp, label %if.then, label %if.else, !dbg !143

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !144
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !146
  store i32 %call2, i32* %data, align 4, !dbg !147
  br label %if.end, !dbg !148

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !149
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !151, metadata !DIExpression()), !dbg !155
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !155
  %3 = load i32, i32* %data, align 4, !dbg !156
  %cmp3 = icmp sge i32 %3, 0, !dbg !158
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !159

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !160
  %cmp4 = icmp slt i32 %4, 10, !dbg !161
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !162

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !163
  %idxprom = sext i32 %5 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !165
  %6 = load i32, i32* %arrayidx, align 4, !dbg !165
  call void @printIntLine(i32 %6), !dbg !166
  br label %if.end7, !dbg !167

if.else6:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !168
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !171 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 -1, i32* %data, align 4, !dbg !174
  store i32 7, i32* %data, align 4, !dbg !175
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !178, metadata !DIExpression()), !dbg !182
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !182
  %1 = load i32, i32* %data, align 4, !dbg !183
  %cmp = icmp sge i32 %1, 0, !dbg !185
  br i1 %cmp, label %if.then, label %if.else, !dbg !186

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !187
  %idxprom = sext i32 %2 to i64, !dbg !189
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !189
  %3 = load i32, i32* %arrayidx, align 4, !dbg !189
  call void @printIntLine(i32 %3), !dbg !190
  br label %if.end, !dbg !191

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !192
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !194
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !195 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !196, metadata !DIExpression()), !dbg !197
  store i32 -1, i32* %data, align 4, !dbg !198
  store i32 7, i32* %data, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !202, metadata !DIExpression()), !dbg !206
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !206
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !206
  %1 = load i32, i32* %data, align 4, !dbg !207
  %cmp = icmp sge i32 %1, 0, !dbg !209
  br i1 %cmp, label %if.then, label %if.else, !dbg !210

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !211
  %idxprom = sext i32 %2 to i64, !dbg !213
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !213
  %3 = load i32, i32* %arrayidx, align 4, !dbg !213
  call void @printIntLine(i32 %3), !dbg !214
  br label %if.end, !dbg !215

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !216
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !218
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_03.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_03_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_03.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 32, type: !24)
!21 = distinct !DILexicalBlock(scope: !22, file: !13, line: 31, column: 9)
!22 = distinct !DILexicalBlock(scope: !23, file: !13, line: 30, column: 5)
!23 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 112, elements: !26)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!27}
!27 = !DISubrange(count: 14)
!28 = !DILocation(line: 32, column: 18, scope: !21)
!29 = !DILocation(line: 34, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 17)
!31 = !DILocation(line: 34, column: 53, scope: !30)
!32 = !DILocation(line: 34, column: 17, scope: !30)
!33 = !DILocation(line: 34, column: 60, scope: !30)
!34 = !DILocation(line: 34, column: 17, scope: !21)
!35 = !DILocation(line: 37, column: 29, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !13, line: 35, column: 13)
!37 = !DILocation(line: 37, column: 24, scope: !36)
!38 = !DILocation(line: 37, column: 22, scope: !36)
!39 = !DILocation(line: 38, column: 13, scope: !36)
!40 = !DILocation(line: 41, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !30, file: !13, line: 40, column: 13)
!42 = !DILocalVariable(name: "buffer", scope: !43, file: !13, line: 48, type: !46)
!43 = distinct !DILexicalBlock(scope: !44, file: !13, line: 47, column: 9)
!44 = distinct !DILexicalBlock(scope: !45, file: !13, line: 46, column: 5)
!45 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 10)
!49 = !DILocation(line: 48, column: 17, scope: !43)
!50 = !DILocation(line: 51, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !13, line: 51, column: 17)
!52 = !DILocation(line: 51, column: 22, scope: !51)
!53 = !DILocation(line: 51, column: 17, scope: !43)
!54 = !DILocation(line: 53, column: 37, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !13, line: 52, column: 13)
!56 = !DILocation(line: 53, column: 30, scope: !55)
!57 = !DILocation(line: 53, column: 17, scope: !55)
!58 = !DILocation(line: 54, column: 13, scope: !55)
!59 = !DILocation(line: 57, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !13, line: 56, column: 13)
!61 = !DILocation(line: 61, column: 1, scope: !12)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_03_good", scope: !13, file: !13, line: 215, type: !14, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 217, column: 5, scope: !62)
!64 = !DILocation(line: 218, column: 5, scope: !62)
!65 = !DILocation(line: 219, column: 5, scope: !62)
!66 = !DILocation(line: 220, column: 5, scope: !62)
!67 = !DILocation(line: 221, column: 1, scope: !62)
!68 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 232, type: !69, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!17, !17, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !13, line: 232, type: !17)
!74 = !DILocation(line: 232, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !13, line: 232, type: !71)
!76 = !DILocation(line: 232, column: 27, scope: !68)
!77 = !DILocation(line: 235, column: 22, scope: !68)
!78 = !DILocation(line: 235, column: 12, scope: !68)
!79 = !DILocation(line: 235, column: 5, scope: !68)
!80 = !DILocation(line: 237, column: 5, scope: !68)
!81 = !DILocation(line: 238, column: 5, scope: !68)
!82 = !DILocation(line: 239, column: 5, scope: !68)
!83 = !DILocation(line: 242, column: 5, scope: !68)
!84 = !DILocation(line: 243, column: 5, scope: !68)
!85 = !DILocation(line: 244, column: 5, scope: !68)
!86 = !DILocation(line: 246, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !13, line: 70, type: !17)
!89 = !DILocation(line: 70, column: 9, scope: !87)
!90 = !DILocation(line: 72, column: 10, scope: !87)
!91 = !DILocalVariable(name: "inputBuffer", scope: !92, file: !13, line: 76, type: !24)
!92 = distinct !DILexicalBlock(scope: !93, file: !13, line: 75, column: 9)
!93 = distinct !DILexicalBlock(scope: !94, file: !13, line: 74, column: 5)
!94 = distinct !DILexicalBlock(scope: !87, file: !13, line: 73, column: 8)
!95 = !DILocation(line: 76, column: 18, scope: !92)
!96 = !DILocation(line: 78, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !13, line: 78, column: 17)
!98 = !DILocation(line: 78, column: 53, scope: !97)
!99 = !DILocation(line: 78, column: 17, scope: !97)
!100 = !DILocation(line: 78, column: 60, scope: !97)
!101 = !DILocation(line: 78, column: 17, scope: !92)
!102 = !DILocation(line: 81, column: 29, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !13, line: 79, column: 13)
!104 = !DILocation(line: 81, column: 24, scope: !103)
!105 = !DILocation(line: 81, column: 22, scope: !103)
!106 = !DILocation(line: 82, column: 13, scope: !103)
!107 = !DILocation(line: 85, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !13, line: 84, column: 13)
!109 = !DILocalVariable(name: "buffer", scope: !110, file: !13, line: 97, type: !46)
!110 = distinct !DILexicalBlock(scope: !111, file: !13, line: 96, column: 9)
!111 = distinct !DILexicalBlock(scope: !112, file: !13, line: 95, column: 5)
!112 = distinct !DILexicalBlock(scope: !87, file: !13, line: 89, column: 8)
!113 = !DILocation(line: 97, column: 17, scope: !110)
!114 = !DILocation(line: 99, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !13, line: 99, column: 17)
!116 = !DILocation(line: 99, column: 22, scope: !115)
!117 = !DILocation(line: 99, column: 27, scope: !115)
!118 = !DILocation(line: 99, column: 30, scope: !115)
!119 = !DILocation(line: 99, column: 35, scope: !115)
!120 = !DILocation(line: 99, column: 17, scope: !110)
!121 = !DILocation(line: 101, column: 37, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !13, line: 100, column: 13)
!123 = !DILocation(line: 101, column: 30, scope: !122)
!124 = !DILocation(line: 101, column: 17, scope: !122)
!125 = !DILocation(line: 102, column: 13, scope: !122)
!126 = !DILocation(line: 105, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !115, file: !13, line: 104, column: 13)
!128 = !DILocation(line: 109, column: 1, scope: !87)
!129 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 112, type: !14, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !13, line: 114, type: !17)
!131 = !DILocation(line: 114, column: 9, scope: !129)
!132 = !DILocation(line: 116, column: 10, scope: !129)
!133 = !DILocalVariable(name: "inputBuffer", scope: !134, file: !13, line: 120, type: !24)
!134 = distinct !DILexicalBlock(scope: !135, file: !13, line: 119, column: 9)
!135 = distinct !DILexicalBlock(scope: !136, file: !13, line: 118, column: 5)
!136 = distinct !DILexicalBlock(scope: !129, file: !13, line: 117, column: 8)
!137 = !DILocation(line: 120, column: 18, scope: !134)
!138 = !DILocation(line: 122, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !13, line: 122, column: 17)
!140 = !DILocation(line: 122, column: 53, scope: !139)
!141 = !DILocation(line: 122, column: 17, scope: !139)
!142 = !DILocation(line: 122, column: 60, scope: !139)
!143 = !DILocation(line: 122, column: 17, scope: !134)
!144 = !DILocation(line: 125, column: 29, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !13, line: 123, column: 13)
!146 = !DILocation(line: 125, column: 24, scope: !145)
!147 = !DILocation(line: 125, column: 22, scope: !145)
!148 = !DILocation(line: 126, column: 13, scope: !145)
!149 = !DILocation(line: 129, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !139, file: !13, line: 128, column: 13)
!151 = !DILocalVariable(name: "buffer", scope: !152, file: !13, line: 136, type: !46)
!152 = distinct !DILexicalBlock(scope: !153, file: !13, line: 135, column: 9)
!153 = distinct !DILexicalBlock(scope: !154, file: !13, line: 134, column: 5)
!154 = distinct !DILexicalBlock(scope: !129, file: !13, line: 133, column: 8)
!155 = !DILocation(line: 136, column: 17, scope: !152)
!156 = !DILocation(line: 138, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !13, line: 138, column: 17)
!158 = !DILocation(line: 138, column: 22, scope: !157)
!159 = !DILocation(line: 138, column: 27, scope: !157)
!160 = !DILocation(line: 138, column: 30, scope: !157)
!161 = !DILocation(line: 138, column: 35, scope: !157)
!162 = !DILocation(line: 138, column: 17, scope: !152)
!163 = !DILocation(line: 140, column: 37, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !13, line: 139, column: 13)
!165 = !DILocation(line: 140, column: 30, scope: !164)
!166 = !DILocation(line: 140, column: 17, scope: !164)
!167 = !DILocation(line: 141, column: 13, scope: !164)
!168 = !DILocation(line: 144, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !157, file: !13, line: 143, column: 13)
!170 = !DILocation(line: 148, column: 1, scope: !129)
!171 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!172 = !DILocalVariable(name: "data", scope: !171, file: !13, line: 153, type: !17)
!173 = !DILocation(line: 153, column: 9, scope: !171)
!174 = !DILocation(line: 155, column: 10, scope: !171)
!175 = !DILocation(line: 165, column: 14, scope: !176)
!176 = distinct !DILexicalBlock(scope: !177, file: !13, line: 162, column: 5)
!177 = distinct !DILexicalBlock(scope: !171, file: !13, line: 156, column: 8)
!178 = !DILocalVariable(name: "buffer", scope: !179, file: !13, line: 170, type: !46)
!179 = distinct !DILexicalBlock(scope: !180, file: !13, line: 169, column: 9)
!180 = distinct !DILexicalBlock(scope: !181, file: !13, line: 168, column: 5)
!181 = distinct !DILexicalBlock(scope: !171, file: !13, line: 167, column: 8)
!182 = !DILocation(line: 170, column: 17, scope: !179)
!183 = !DILocation(line: 173, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !13, line: 173, column: 17)
!185 = !DILocation(line: 173, column: 22, scope: !184)
!186 = !DILocation(line: 173, column: 17, scope: !179)
!187 = !DILocation(line: 175, column: 37, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !13, line: 174, column: 13)
!189 = !DILocation(line: 175, column: 30, scope: !188)
!190 = !DILocation(line: 175, column: 17, scope: !188)
!191 = !DILocation(line: 176, column: 13, scope: !188)
!192 = !DILocation(line: 179, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !184, file: !13, line: 178, column: 13)
!194 = !DILocation(line: 183, column: 1, scope: !171)
!195 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 186, type: !14, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!196 = !DILocalVariable(name: "data", scope: !195, file: !13, line: 188, type: !17)
!197 = !DILocation(line: 188, column: 9, scope: !195)
!198 = !DILocation(line: 190, column: 10, scope: !195)
!199 = !DILocation(line: 195, column: 14, scope: !200)
!200 = distinct !DILexicalBlock(scope: !201, file: !13, line: 192, column: 5)
!201 = distinct !DILexicalBlock(scope: !195, file: !13, line: 191, column: 8)
!202 = !DILocalVariable(name: "buffer", scope: !203, file: !13, line: 200, type: !46)
!203 = distinct !DILexicalBlock(scope: !204, file: !13, line: 199, column: 9)
!204 = distinct !DILexicalBlock(scope: !205, file: !13, line: 198, column: 5)
!205 = distinct !DILexicalBlock(scope: !195, file: !13, line: 197, column: 8)
!206 = !DILocation(line: 200, column: 17, scope: !203)
!207 = !DILocation(line: 203, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !13, line: 203, column: 17)
!209 = !DILocation(line: 203, column: 22, scope: !208)
!210 = !DILocation(line: 203, column: 17, scope: !203)
!211 = !DILocation(line: 205, column: 37, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !13, line: 204, column: 13)
!213 = !DILocation(line: 205, column: 30, scope: !212)
!214 = !DILocation(line: 205, column: 17, scope: !212)
!215 = !DILocation(line: 206, column: 13, scope: !212)
!216 = !DILocation(line: 209, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !208, file: !13, line: 208, column: 13)
!218 = !DILocation(line: 213, column: 1, scope: !195)
