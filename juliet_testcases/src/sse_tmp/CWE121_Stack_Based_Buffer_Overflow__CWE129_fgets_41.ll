; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %2 = load i32, i32* %data, align 4, !dbg !40
  call void @badSink(i32 %2), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !51, metadata !DIExpression()), !dbg !55
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !55
  %1 = load i32, i32* %data.addr, align 4, !dbg !56
  %cmp = icmp sge i32 %1, 0, !dbg !58
  br i1 %cmp, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !60
  %idxprom = sext i32 %2 to i64, !dbg !62
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !62
  store i32 1, i32* %arrayidx, align 4, !dbg !63
  store i32 0, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !67
  %cmp1 = icmp slt i32 %3, 10, !dbg !69
  br i1 %cmp1, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !71
  %idxprom2 = sext i32 %4 to i64, !dbg !73
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !73
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !73
  call void @printIntLine(i32 %5), !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !76
  %inc = add nsw i32 %6, 1, !dbg !76
  store i32 %inc, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !81

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !82
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41_good() #0 !dbg !85 {
entry:
  call void @goodB2G(), !dbg !86
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !108 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %data, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !112, metadata !DIExpression()), !dbg !114
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !115
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !117
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !118
  %cmp = icmp ne i8* %call, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !121
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !123
  store i32 %call2, i32* %data, align 4, !dbg !124
  br label %if.end, !dbg !125

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !128
  call void @goodB2GSink(i32 %2), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !131 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !138
  %1 = load i32, i32* %data.addr, align 4, !dbg !139
  %cmp = icmp sge i32 %1, 0, !dbg !141
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !142

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !143
  %cmp1 = icmp slt i32 %2, 10, !dbg !144
  br i1 %cmp1, label %if.then, label %if.else, !dbg !145

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !146
  %idxprom = sext i32 %3 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !148
  store i32 1, i32* %arrayidx, align 4, !dbg !149
  store i32 0, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !153
  %cmp2 = icmp slt i32 %4, 10, !dbg !155
  br i1 %cmp2, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !157
  %idxprom3 = sext i32 %5 to i64, !dbg !159
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !159
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !159
  call void @printIntLine(i32 %6), !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !162
  %inc = add nsw i32 %7, 1, !dbg !162
  store i32 %inc, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !166

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !167
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !170 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !171, metadata !DIExpression()), !dbg !172
  store i32 -1, i32* %data, align 4, !dbg !173
  store i32 7, i32* %data, align 4, !dbg !174
  %0 = load i32, i32* %data, align 4, !dbg !175
  call void @goodG2BSink(i32 %0), !dbg !176
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !178 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i32* %i, metadata !181, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !184, metadata !DIExpression()), !dbg !185
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !185
  %1 = load i32, i32* %data.addr, align 4, !dbg !186
  %cmp = icmp sge i32 %1, 0, !dbg !188
  br i1 %cmp, label %if.then, label %if.else, !dbg !189

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !190
  %idxprom = sext i32 %2 to i64, !dbg !192
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !192
  store i32 1, i32* %arrayidx, align 4, !dbg !193
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !197
  %cmp1 = icmp slt i32 %3, 10, !dbg !199
  br i1 %cmp1, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !201
  %idxprom2 = sext i32 %4 to i64, !dbg !203
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !203
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !203
  call void @printIntLine(i32 %5), !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !206
  %inc = add nsw i32 %6, 1, !dbg !206
  store i32 %inc, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !210

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !211
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !213
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41_bad", scope: !13, file: !13, line: 47, type: !14, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 49, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 49, column: 9, scope: !12)
!19 = !DILocation(line: 51, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 53, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 52, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 53, column: 14, scope: !21)
!27 = !DILocation(line: 55, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 55, column: 13)
!29 = !DILocation(line: 55, column: 49, scope: !28)
!30 = !DILocation(line: 55, column: 13, scope: !28)
!31 = !DILocation(line: 55, column: 56, scope: !28)
!32 = !DILocation(line: 55, column: 13, scope: !21)
!33 = !DILocation(line: 58, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 56, column: 9)
!35 = !DILocation(line: 58, column: 20, scope: !34)
!36 = !DILocation(line: 58, column: 18, scope: !34)
!37 = !DILocation(line: 59, column: 9, scope: !34)
!38 = !DILocation(line: 62, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 61, column: 9)
!40 = !DILocation(line: 65, column: 13, scope: !12)
!41 = !DILocation(line: 65, column: 5, scope: !12)
!42 = !DILocation(line: 66, column: 1, scope: !12)
!43 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 24, type: !44, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !17}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !13, line: 24, type: !17)
!47 = !DILocation(line: 24, column: 25, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !49, file: !13, line: 27, type: !17)
!49 = distinct !DILexicalBlock(scope: !43, file: !13, line: 26, column: 5)
!50 = !DILocation(line: 27, column: 13, scope: !49)
!51 = !DILocalVariable(name: "buffer", scope: !49, file: !13, line: 28, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 10)
!55 = !DILocation(line: 28, column: 13, scope: !49)
!56 = !DILocation(line: 31, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !13, line: 31, column: 13)
!58 = !DILocation(line: 31, column: 18, scope: !57)
!59 = !DILocation(line: 31, column: 13, scope: !49)
!60 = !DILocation(line: 33, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !13, line: 32, column: 9)
!62 = !DILocation(line: 33, column: 13, scope: !61)
!63 = !DILocation(line: 33, column: 26, scope: !61)
!64 = !DILocation(line: 35, column: 19, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 35, column: 13)
!66 = !DILocation(line: 35, column: 17, scope: !65)
!67 = !DILocation(line: 35, column: 24, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !13, line: 35, column: 13)
!69 = !DILocation(line: 35, column: 26, scope: !68)
!70 = !DILocation(line: 35, column: 13, scope: !65)
!71 = !DILocation(line: 37, column: 37, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !13, line: 36, column: 13)
!73 = !DILocation(line: 37, column: 30, scope: !72)
!74 = !DILocation(line: 37, column: 17, scope: !72)
!75 = !DILocation(line: 38, column: 13, scope: !72)
!76 = !DILocation(line: 35, column: 33, scope: !68)
!77 = !DILocation(line: 35, column: 13, scope: !68)
!78 = distinct !{!78, !70, !79, !80}
!79 = !DILocation(line: 38, column: 13, scope: !65)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 39, column: 9, scope: !61)
!82 = !DILocation(line: 42, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !57, file: !13, line: 41, column: 9)
!84 = !DILocation(line: 45, column: 1, scope: !43)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_41_good", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 153, column: 5, scope: !85)
!87 = !DILocation(line: 154, column: 5, scope: !85)
!88 = !DILocation(line: 155, column: 1, scope: !85)
!89 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 166, type: !90, scopeLine: 167, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!17, !17, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !13, line: 166, type: !17)
!95 = !DILocation(line: 166, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !13, line: 166, type: !92)
!97 = !DILocation(line: 166, column: 27, scope: !89)
!98 = !DILocation(line: 169, column: 22, scope: !89)
!99 = !DILocation(line: 169, column: 12, scope: !89)
!100 = !DILocation(line: 169, column: 5, scope: !89)
!101 = !DILocation(line: 171, column: 5, scope: !89)
!102 = !DILocation(line: 172, column: 5, scope: !89)
!103 = !DILocation(line: 173, column: 5, scope: !89)
!104 = !DILocation(line: 176, column: 5, scope: !89)
!105 = !DILocation(line: 177, column: 5, scope: !89)
!106 = !DILocation(line: 178, column: 5, scope: !89)
!107 = !DILocation(line: 180, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 130, type: !14, scopeLine: 131, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !13, line: 132, type: !17)
!110 = !DILocation(line: 132, column: 9, scope: !108)
!111 = !DILocation(line: 134, column: 10, scope: !108)
!112 = !DILocalVariable(name: "inputBuffer", scope: !113, file: !13, line: 136, type: !22)
!113 = distinct !DILexicalBlock(scope: !108, file: !13, line: 135, column: 5)
!114 = !DILocation(line: 136, column: 14, scope: !113)
!115 = !DILocation(line: 138, column: 19, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !13, line: 138, column: 13)
!117 = !DILocation(line: 138, column: 49, scope: !116)
!118 = !DILocation(line: 138, column: 13, scope: !116)
!119 = !DILocation(line: 138, column: 56, scope: !116)
!120 = !DILocation(line: 138, column: 13, scope: !113)
!121 = !DILocation(line: 141, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !13, line: 139, column: 9)
!123 = !DILocation(line: 141, column: 20, scope: !122)
!124 = !DILocation(line: 141, column: 18, scope: !122)
!125 = !DILocation(line: 142, column: 9, scope: !122)
!126 = !DILocation(line: 145, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !116, file: !13, line: 144, column: 9)
!128 = !DILocation(line: 148, column: 17, scope: !108)
!129 = !DILocation(line: 148, column: 5, scope: !108)
!130 = !DILocation(line: 149, column: 1, scope: !108)
!131 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 108, type: !44, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", arg: 1, scope: !131, file: !13, line: 108, type: !17)
!133 = !DILocation(line: 108, column: 29, scope: !131)
!134 = !DILocalVariable(name: "i", scope: !135, file: !13, line: 111, type: !17)
!135 = distinct !DILexicalBlock(scope: !131, file: !13, line: 110, column: 5)
!136 = !DILocation(line: 111, column: 13, scope: !135)
!137 = !DILocalVariable(name: "buffer", scope: !135, file: !13, line: 112, type: !52)
!138 = !DILocation(line: 112, column: 13, scope: !135)
!139 = !DILocation(line: 114, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !13, line: 114, column: 13)
!141 = !DILocation(line: 114, column: 18, scope: !140)
!142 = !DILocation(line: 114, column: 23, scope: !140)
!143 = !DILocation(line: 114, column: 26, scope: !140)
!144 = !DILocation(line: 114, column: 31, scope: !140)
!145 = !DILocation(line: 114, column: 13, scope: !135)
!146 = !DILocation(line: 116, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !13, line: 115, column: 9)
!148 = !DILocation(line: 116, column: 13, scope: !147)
!149 = !DILocation(line: 116, column: 26, scope: !147)
!150 = !DILocation(line: 118, column: 19, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !13, line: 118, column: 13)
!152 = !DILocation(line: 118, column: 17, scope: !151)
!153 = !DILocation(line: 118, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !13, line: 118, column: 13)
!155 = !DILocation(line: 118, column: 26, scope: !154)
!156 = !DILocation(line: 118, column: 13, scope: !151)
!157 = !DILocation(line: 120, column: 37, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !13, line: 119, column: 13)
!159 = !DILocation(line: 120, column: 30, scope: !158)
!160 = !DILocation(line: 120, column: 17, scope: !158)
!161 = !DILocation(line: 121, column: 13, scope: !158)
!162 = !DILocation(line: 118, column: 33, scope: !154)
!163 = !DILocation(line: 118, column: 13, scope: !154)
!164 = distinct !{!164, !156, !165, !80}
!165 = !DILocation(line: 121, column: 13, scope: !151)
!166 = !DILocation(line: 122, column: 9, scope: !147)
!167 = !DILocation(line: 125, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !140, file: !13, line: 124, column: 9)
!169 = !DILocation(line: 128, column: 1, scope: !131)
!170 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 96, type: !14, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DILocalVariable(name: "data", scope: !170, file: !13, line: 98, type: !17)
!172 = !DILocation(line: 98, column: 9, scope: !170)
!173 = !DILocation(line: 100, column: 10, scope: !170)
!174 = !DILocation(line: 103, column: 10, scope: !170)
!175 = !DILocation(line: 104, column: 17, scope: !170)
!176 = !DILocation(line: 104, column: 5, scope: !170)
!177 = !DILocation(line: 105, column: 1, scope: !170)
!178 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 73, type: !44, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!179 = !DILocalVariable(name: "data", arg: 1, scope: !178, file: !13, line: 73, type: !17)
!180 = !DILocation(line: 73, column: 29, scope: !178)
!181 = !DILocalVariable(name: "i", scope: !182, file: !13, line: 76, type: !17)
!182 = distinct !DILexicalBlock(scope: !178, file: !13, line: 75, column: 5)
!183 = !DILocation(line: 76, column: 13, scope: !182)
!184 = !DILocalVariable(name: "buffer", scope: !182, file: !13, line: 77, type: !52)
!185 = !DILocation(line: 77, column: 13, scope: !182)
!186 = !DILocation(line: 80, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !13, line: 80, column: 13)
!188 = !DILocation(line: 80, column: 18, scope: !187)
!189 = !DILocation(line: 80, column: 13, scope: !182)
!190 = !DILocation(line: 82, column: 20, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !13, line: 81, column: 9)
!192 = !DILocation(line: 82, column: 13, scope: !191)
!193 = !DILocation(line: 82, column: 26, scope: !191)
!194 = !DILocation(line: 84, column: 19, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !13, line: 84, column: 13)
!196 = !DILocation(line: 84, column: 17, scope: !195)
!197 = !DILocation(line: 84, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !13, line: 84, column: 13)
!199 = !DILocation(line: 84, column: 26, scope: !198)
!200 = !DILocation(line: 84, column: 13, scope: !195)
!201 = !DILocation(line: 86, column: 37, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !13, line: 85, column: 13)
!203 = !DILocation(line: 86, column: 30, scope: !202)
!204 = !DILocation(line: 86, column: 17, scope: !202)
!205 = !DILocation(line: 87, column: 13, scope: !202)
!206 = !DILocation(line: 84, column: 33, scope: !198)
!207 = !DILocation(line: 84, column: 13, scope: !198)
!208 = distinct !{!208, !200, !209, !80}
!209 = !DILocation(line: 87, column: 13, scope: !195)
!210 = !DILocation(line: 88, column: 9, scope: !191)
!211 = !DILocation(line: 91, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !187, file: !13, line: 90, column: 9)
!213 = !DILocation(line: 94, column: 1, scope: !178)
