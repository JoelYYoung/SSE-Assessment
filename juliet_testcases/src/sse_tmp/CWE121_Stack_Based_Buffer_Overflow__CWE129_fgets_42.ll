; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  %call = call i32 @badSource(i32 %0), !dbg !21
  store i32 %call, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !26, metadata !DIExpression()), !dbg !30
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !30
  %2 = load i32, i32* %data, align 4, !dbg !31
  %cmp = icmp sge i32 %2, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !35
  %idxprom = sext i32 %3 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !42
  %cmp1 = icmp slt i32 %4, 10, !dbg !44
  br i1 %cmp1, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom2 = sext i32 %5 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !48
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !48
  call void @printIntLine(i32 %6), !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %7, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !56

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !65, metadata !DIExpression()), !dbg !71
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !71
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !72
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !74
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !75
  %cmp = icmp ne i8* %call, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !78
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !80
  store i32 %call2, i32* %data.addr, align 4, !dbg !81
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0)), !dbg !83
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !85
  ret i32 %2, !dbg !86
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42_good() #0 !dbg !87 {
entry:
  call void @goodB2G(), !dbg !88
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !110 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %data, align 4, !dbg !113
  %0 = load i32, i32* %data, align 4, !dbg !114
  %call = call i32 @goodB2GSource(i32 %0), !dbg !115
  store i32 %call, i32* %data, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %i, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !120, metadata !DIExpression()), !dbg !121
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !121
  %2 = load i32, i32* %data, align 4, !dbg !122
  %cmp = icmp sge i32 %2, 0, !dbg !124
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !125

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !126
  %cmp1 = icmp slt i32 %3, 10, !dbg !127
  br i1 %cmp1, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !129
  %idxprom = sext i32 %4 to i64, !dbg !131
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !131
  store i32 1, i32* %arrayidx, align 4, !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !136
  %cmp2 = icmp slt i32 %5, 10, !dbg !138
  br i1 %cmp2, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !140
  %idxprom3 = sext i32 %6 to i64, !dbg !142
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !142
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !142
  call void @printIntLine(i32 %7), !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !145
  %inc = add nsw i32 %8, 1, !dbg !145
  store i32 %inc, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !149

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !150
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !153 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !156, metadata !DIExpression()), !dbg !158
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !161
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !162
  %cmp = icmp ne i8* %call, null, !dbg !163
  br i1 %cmp, label %if.then, label %if.else, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !167
  store i32 %call2, i32* %data.addr, align 4, !dbg !168
  br label %if.end, !dbg !169

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !172
  ret i32 %2, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !174 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !175, metadata !DIExpression()), !dbg !176
  store i32 -1, i32* %data, align 4, !dbg !177
  %0 = load i32, i32* %data, align 4, !dbg !178
  %call = call i32 @goodG2BSource(i32 %0), !dbg !179
  store i32 %call, i32* %data, align 4, !dbg !180
  call void @llvm.dbg.declare(metadata i32* %i, metadata !181, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !184, metadata !DIExpression()), !dbg !185
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !185
  %2 = load i32, i32* %data, align 4, !dbg !186
  %cmp = icmp sge i32 %2, 0, !dbg !188
  br i1 %cmp, label %if.then, label %if.else, !dbg !189

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !190
  %idxprom = sext i32 %3 to i64, !dbg !192
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !192
  store i32 1, i32* %arrayidx, align 4, !dbg !193
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !197
  %cmp1 = icmp slt i32 %4, 10, !dbg !199
  br i1 %cmp1, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !201
  %idxprom2 = sext i32 %5 to i64, !dbg !203
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !203
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !203
  call void @printIntLine(i32 %6), !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !206
  %inc = add nsw i32 %7, 1, !dbg !206
  store i32 %inc, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !210

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !211
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !214 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 7, i32* %data.addr, align 4, !dbg !217
  %0 = load i32, i32* %data.addr, align 4, !dbg !218
  ret i32 %0, !dbg !219
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42_bad", scope: !13, file: !13, line: 42, type: !14, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 44, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 44, column: 9, scope: !12)
!19 = !DILocation(line: 46, column: 10, scope: !12)
!20 = !DILocation(line: 47, column: 22, scope: !12)
!21 = !DILocation(line: 47, column: 12, scope: !12)
!22 = !DILocation(line: 47, column: 10, scope: !12)
!23 = !DILocalVariable(name: "i", scope: !24, file: !13, line: 49, type: !17)
!24 = distinct !DILexicalBlock(scope: !12, file: !13, line: 48, column: 5)
!25 = !DILocation(line: 49, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !13, line: 50, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 50, column: 13, scope: !24)
!31 = !DILocation(line: 53, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !13, line: 53, column: 13)
!33 = !DILocation(line: 53, column: 18, scope: !32)
!34 = !DILocation(line: 53, column: 13, scope: !24)
!35 = !DILocation(line: 55, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !13, line: 54, column: 9)
!37 = !DILocation(line: 55, column: 13, scope: !36)
!38 = !DILocation(line: 55, column: 26, scope: !36)
!39 = !DILocation(line: 57, column: 19, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 57, column: 13)
!41 = !DILocation(line: 57, column: 17, scope: !40)
!42 = !DILocation(line: 57, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !13, line: 57, column: 13)
!44 = !DILocation(line: 57, column: 26, scope: !43)
!45 = !DILocation(line: 57, column: 13, scope: !40)
!46 = !DILocation(line: 59, column: 37, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !13, line: 58, column: 13)
!48 = !DILocation(line: 59, column: 30, scope: !47)
!49 = !DILocation(line: 59, column: 17, scope: !47)
!50 = !DILocation(line: 60, column: 13, scope: !47)
!51 = !DILocation(line: 57, column: 33, scope: !43)
!52 = !DILocation(line: 57, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 60, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 61, column: 9, scope: !36)
!57 = !DILocation(line: 64, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !32, file: !13, line: 63, column: 9)
!59 = !DILocation(line: 67, column: 1, scope: !12)
!60 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 24, type: !61, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!17, !17}
!63 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !13, line: 24, type: !17)
!64 = !DILocation(line: 24, column: 26, scope: !60)
!65 = !DILocalVariable(name: "inputBuffer", scope: !66, file: !13, line: 27, type: !67)
!66 = distinct !DILexicalBlock(scope: !60, file: !13, line: 26, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 112, elements: !69)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !{!70}
!70 = !DISubrange(count: 14)
!71 = !DILocation(line: 27, column: 14, scope: !66)
!72 = !DILocation(line: 29, column: 19, scope: !73)
!73 = distinct !DILexicalBlock(scope: !66, file: !13, line: 29, column: 13)
!74 = !DILocation(line: 29, column: 49, scope: !73)
!75 = !DILocation(line: 29, column: 13, scope: !73)
!76 = !DILocation(line: 29, column: 56, scope: !73)
!77 = !DILocation(line: 29, column: 13, scope: !66)
!78 = !DILocation(line: 32, column: 25, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !13, line: 30, column: 9)
!80 = !DILocation(line: 32, column: 20, scope: !79)
!81 = !DILocation(line: 32, column: 18, scope: !79)
!82 = !DILocation(line: 33, column: 9, scope: !79)
!83 = !DILocation(line: 36, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !73, file: !13, line: 35, column: 9)
!85 = !DILocation(line: 39, column: 12, scope: !60)
!86 = !DILocation(line: 39, column: 5, scope: !60)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_42_good", scope: !13, file: !13, line: 154, type: !14, scopeLine: 155, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 156, column: 5, scope: !87)
!89 = !DILocation(line: 157, column: 5, scope: !87)
!90 = !DILocation(line: 158, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 169, type: !92, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!17, !17, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !13, line: 169, type: !17)
!97 = !DILocation(line: 169, column: 14, scope: !91)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !13, line: 169, type: !94)
!99 = !DILocation(line: 169, column: 27, scope: !91)
!100 = !DILocation(line: 172, column: 22, scope: !91)
!101 = !DILocation(line: 172, column: 12, scope: !91)
!102 = !DILocation(line: 172, column: 5, scope: !91)
!103 = !DILocation(line: 174, column: 5, scope: !91)
!104 = !DILocation(line: 175, column: 5, scope: !91)
!105 = !DILocation(line: 176, column: 5, scope: !91)
!106 = !DILocation(line: 179, column: 5, scope: !91)
!107 = !DILocation(line: 180, column: 5, scope: !91)
!108 = !DILocation(line: 181, column: 5, scope: !91)
!109 = !DILocation(line: 183, column: 5, scope: !91)
!110 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 128, type: !14, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !13, line: 130, type: !17)
!112 = !DILocation(line: 130, column: 9, scope: !110)
!113 = !DILocation(line: 132, column: 10, scope: !110)
!114 = !DILocation(line: 133, column: 26, scope: !110)
!115 = !DILocation(line: 133, column: 12, scope: !110)
!116 = !DILocation(line: 133, column: 10, scope: !110)
!117 = !DILocalVariable(name: "i", scope: !118, file: !13, line: 135, type: !17)
!118 = distinct !DILexicalBlock(scope: !110, file: !13, line: 134, column: 5)
!119 = !DILocation(line: 135, column: 13, scope: !118)
!120 = !DILocalVariable(name: "buffer", scope: !118, file: !13, line: 136, type: !27)
!121 = !DILocation(line: 136, column: 13, scope: !118)
!122 = !DILocation(line: 138, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !13, line: 138, column: 13)
!124 = !DILocation(line: 138, column: 18, scope: !123)
!125 = !DILocation(line: 138, column: 23, scope: !123)
!126 = !DILocation(line: 138, column: 26, scope: !123)
!127 = !DILocation(line: 138, column: 31, scope: !123)
!128 = !DILocation(line: 138, column: 13, scope: !118)
!129 = !DILocation(line: 140, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !13, line: 139, column: 9)
!131 = !DILocation(line: 140, column: 13, scope: !130)
!132 = !DILocation(line: 140, column: 26, scope: !130)
!133 = !DILocation(line: 142, column: 19, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 142, column: 13)
!135 = !DILocation(line: 142, column: 17, scope: !134)
!136 = !DILocation(line: 142, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !13, line: 142, column: 13)
!138 = !DILocation(line: 142, column: 26, scope: !137)
!139 = !DILocation(line: 142, column: 13, scope: !134)
!140 = !DILocation(line: 144, column: 37, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !13, line: 143, column: 13)
!142 = !DILocation(line: 144, column: 30, scope: !141)
!143 = !DILocation(line: 144, column: 17, scope: !141)
!144 = !DILocation(line: 145, column: 13, scope: !141)
!145 = !DILocation(line: 142, column: 33, scope: !137)
!146 = !DILocation(line: 142, column: 13, scope: !137)
!147 = distinct !{!147, !139, !148, !55}
!148 = !DILocation(line: 145, column: 13, scope: !134)
!149 = !DILocation(line: 146, column: 9, scope: !130)
!150 = !DILocation(line: 149, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !123, file: !13, line: 148, column: 9)
!152 = !DILocation(line: 152, column: 1, scope: !110)
!153 = distinct !DISubprogram(name: "goodB2GSource", scope: !13, file: !13, line: 110, type: !61, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", arg: 1, scope: !153, file: !13, line: 110, type: !17)
!155 = !DILocation(line: 110, column: 30, scope: !153)
!156 = !DILocalVariable(name: "inputBuffer", scope: !157, file: !13, line: 113, type: !67)
!157 = distinct !DILexicalBlock(scope: !153, file: !13, line: 112, column: 5)
!158 = !DILocation(line: 113, column: 14, scope: !157)
!159 = !DILocation(line: 115, column: 19, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !13, line: 115, column: 13)
!161 = !DILocation(line: 115, column: 49, scope: !160)
!162 = !DILocation(line: 115, column: 13, scope: !160)
!163 = !DILocation(line: 115, column: 56, scope: !160)
!164 = !DILocation(line: 115, column: 13, scope: !157)
!165 = !DILocation(line: 118, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !13, line: 116, column: 9)
!167 = !DILocation(line: 118, column: 20, scope: !166)
!168 = !DILocation(line: 118, column: 18, scope: !166)
!169 = !DILocation(line: 119, column: 9, scope: !166)
!170 = !DILocation(line: 122, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !160, file: !13, line: 121, column: 9)
!172 = !DILocation(line: 125, column: 12, scope: !153)
!173 = !DILocation(line: 125, column: 5, scope: !153)
!174 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 82, type: !14, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!175 = !DILocalVariable(name: "data", scope: !174, file: !13, line: 84, type: !17)
!176 = !DILocation(line: 84, column: 9, scope: !174)
!177 = !DILocation(line: 86, column: 10, scope: !174)
!178 = !DILocation(line: 87, column: 26, scope: !174)
!179 = !DILocation(line: 87, column: 12, scope: !174)
!180 = !DILocation(line: 87, column: 10, scope: !174)
!181 = !DILocalVariable(name: "i", scope: !182, file: !13, line: 89, type: !17)
!182 = distinct !DILexicalBlock(scope: !174, file: !13, line: 88, column: 5)
!183 = !DILocation(line: 89, column: 13, scope: !182)
!184 = !DILocalVariable(name: "buffer", scope: !182, file: !13, line: 90, type: !27)
!185 = !DILocation(line: 90, column: 13, scope: !182)
!186 = !DILocation(line: 93, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !13, line: 93, column: 13)
!188 = !DILocation(line: 93, column: 18, scope: !187)
!189 = !DILocation(line: 93, column: 13, scope: !182)
!190 = !DILocation(line: 95, column: 20, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !13, line: 94, column: 9)
!192 = !DILocation(line: 95, column: 13, scope: !191)
!193 = !DILocation(line: 95, column: 26, scope: !191)
!194 = !DILocation(line: 97, column: 19, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !13, line: 97, column: 13)
!196 = !DILocation(line: 97, column: 17, scope: !195)
!197 = !DILocation(line: 97, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !13, line: 97, column: 13)
!199 = !DILocation(line: 97, column: 26, scope: !198)
!200 = !DILocation(line: 97, column: 13, scope: !195)
!201 = !DILocation(line: 99, column: 37, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !13, line: 98, column: 13)
!203 = !DILocation(line: 99, column: 30, scope: !202)
!204 = !DILocation(line: 99, column: 17, scope: !202)
!205 = !DILocation(line: 100, column: 13, scope: !202)
!206 = !DILocation(line: 97, column: 33, scope: !198)
!207 = !DILocation(line: 97, column: 13, scope: !198)
!208 = distinct !{!208, !200, !209, !55}
!209 = !DILocation(line: 100, column: 13, scope: !195)
!210 = !DILocation(line: 101, column: 9, scope: !191)
!211 = !DILocation(line: 104, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !187, file: !13, line: 103, column: 9)
!213 = !DILocation(line: 107, column: 1, scope: !174)
!214 = distinct !DISubprogram(name: "goodG2BSource", scope: !13, file: !13, line: 74, type: !61, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!215 = !DILocalVariable(name: "data", arg: 1, scope: !214, file: !13, line: 74, type: !17)
!216 = !DILocation(line: 74, column: 30, scope: !214)
!217 = !DILocation(line: 78, column: 10, scope: !214)
!218 = !DILocation(line: 79, column: 12, scope: !214)
!219 = !DILocation(line: 79, column: 5, scope: !214)
