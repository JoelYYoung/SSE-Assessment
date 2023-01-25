; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !40, metadata !DIExpression()), !dbg !42
  %2 = load i32, i32* %data, align 4, !dbg !43
  store i32 %2, i32* %dataCopy, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !44, metadata !DIExpression()), !dbg !45
  %3 = load i32, i32* %dataCopy, align 4, !dbg !46
  store i32 %3, i32* %data3, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !50, metadata !DIExpression()), !dbg !54
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !54
  %5 = load i32, i32* %data3, align 4, !dbg !55
  %cmp4 = icmp sge i32 %5, 0, !dbg !57
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !58

if.then5:                                         ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !59
  %idxprom = sext i32 %6 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !61
  store i32 1, i32* %arrayidx, align 4, !dbg !62
  store i32 0, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.then5
  %7 = load i32, i32* %i, align 4, !dbg !66
  %cmp6 = icmp slt i32 %7, 10, !dbg !68
  br i1 %cmp6, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !70
  %idxprom7 = sext i32 %8 to i64, !dbg !72
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !72
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !72
  call void @printIntLine(i32 %9), !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !75
  %inc = add nsw i32 %10, 1, !dbg !75
  store i32 %inc, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !80

if.else9:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !83
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  call void @goodB2G(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %data, align 4, !dbg !110
  store i32 7, i32* %data, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !112, metadata !DIExpression()), !dbg !114
  %0 = load i32, i32* %data, align 4, !dbg !115
  store i32 %0, i32* %dataCopy, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !116, metadata !DIExpression()), !dbg !117
  %1 = load i32, i32* %dataCopy, align 4, !dbg !118
  store i32 %1, i32* %data1, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i32* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !122, metadata !DIExpression()), !dbg !123
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !123
  %3 = load i32, i32* %data1, align 4, !dbg !124
  %cmp = icmp sge i32 %3, 0, !dbg !126
  br i1 %cmp, label %if.then, label %if.else, !dbg !127

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !128
  %idxprom = sext i32 %4 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !130
  store i32 1, i32* %arrayidx, align 4, !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !135
  %cmp2 = icmp slt i32 %5, 10, !dbg !137
  br i1 %cmp2, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !139
  %idxprom3 = sext i32 %6 to i64, !dbg !141
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !141
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !141
  call void @printIntLine(i32 %7), !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %8, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !148

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !149
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !152 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 -1, i32* %data, align 4, !dbg !155
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
  store i32 %call2, i32* %data, align 4, !dbg !168
  br label %if.end, !dbg !169

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !172, metadata !DIExpression()), !dbg !174
  %2 = load i32, i32* %data, align 4, !dbg !175
  store i32 %2, i32* %dataCopy, align 4, !dbg !174
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !176, metadata !DIExpression()), !dbg !177
  %3 = load i32, i32* %dataCopy, align 4, !dbg !178
  store i32 %3, i32* %data3, align 4, !dbg !177
  call void @llvm.dbg.declare(metadata i32* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !182, metadata !DIExpression()), !dbg !183
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !183
  %5 = load i32, i32* %data3, align 4, !dbg !184
  %cmp4 = icmp sge i32 %5, 0, !dbg !186
  br i1 %cmp4, label %land.lhs.true, label %if.else10, !dbg !187

land.lhs.true:                                    ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !188
  %cmp5 = icmp slt i32 %6, 10, !dbg !189
  br i1 %cmp5, label %if.then6, label %if.else10, !dbg !190

if.then6:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data3, align 4, !dbg !191
  %idxprom = sext i32 %7 to i64, !dbg !193
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !193
  store i32 1, i32* %arrayidx, align 4, !dbg !194
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.inc, %if.then6
  %8 = load i32, i32* %i, align 4, !dbg !198
  %cmp7 = icmp slt i32 %8, 10, !dbg !200
  br i1 %cmp7, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !202
  %idxprom8 = sext i32 %9 to i64, !dbg !204
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !204
  %10 = load i32, i32* %arrayidx9, align 4, !dbg !204
  call void @printIntLine(i32 %10), !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !207
  %inc = add nsw i32 %11, 1, !dbg !207
  store i32 %inc, i32* %i, align 4, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  br label %if.end11, !dbg !211

if.else10:                                        ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !212
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %for.end
  ret void, !dbg !214
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 30, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 30, column: 14, scope: !21)
!27 = !DILocation(line: 32, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 32, column: 13)
!29 = !DILocation(line: 32, column: 49, scope: !28)
!30 = !DILocation(line: 32, column: 13, scope: !28)
!31 = !DILocation(line: 32, column: 56, scope: !28)
!32 = !DILocation(line: 32, column: 13, scope: !21)
!33 = !DILocation(line: 35, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 33, column: 9)
!35 = !DILocation(line: 35, column: 20, scope: !34)
!36 = !DILocation(line: 35, column: 18, scope: !34)
!37 = !DILocation(line: 36, column: 9, scope: !34)
!38 = !DILocation(line: 39, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 38, column: 9)
!40 = !DILocalVariable(name: "dataCopy", scope: !41, file: !13, line: 43, type: !17)
!41 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 5)
!42 = !DILocation(line: 43, column: 13, scope: !41)
!43 = !DILocation(line: 43, column: 24, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !13, line: 44, type: !17)
!45 = !DILocation(line: 44, column: 13, scope: !41)
!46 = !DILocation(line: 44, column: 20, scope: !41)
!47 = !DILocalVariable(name: "i", scope: !48, file: !13, line: 46, type: !17)
!48 = distinct !DILexicalBlock(scope: !41, file: !13, line: 45, column: 9)
!49 = !DILocation(line: 46, column: 17, scope: !48)
!50 = !DILocalVariable(name: "buffer", scope: !48, file: !13, line: 47, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 10)
!54 = !DILocation(line: 47, column: 17, scope: !48)
!55 = !DILocation(line: 50, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !48, file: !13, line: 50, column: 17)
!57 = !DILocation(line: 50, column: 22, scope: !56)
!58 = !DILocation(line: 50, column: 17, scope: !48)
!59 = !DILocation(line: 52, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !13, line: 51, column: 13)
!61 = !DILocation(line: 52, column: 17, scope: !60)
!62 = !DILocation(line: 52, column: 30, scope: !60)
!63 = !DILocation(line: 54, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 54, column: 17)
!65 = !DILocation(line: 54, column: 21, scope: !64)
!66 = !DILocation(line: 54, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !13, line: 54, column: 17)
!68 = !DILocation(line: 54, column: 30, scope: !67)
!69 = !DILocation(line: 54, column: 17, scope: !64)
!70 = !DILocation(line: 56, column: 41, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !13, line: 55, column: 17)
!72 = !DILocation(line: 56, column: 34, scope: !71)
!73 = !DILocation(line: 56, column: 21, scope: !71)
!74 = !DILocation(line: 57, column: 17, scope: !71)
!75 = !DILocation(line: 54, column: 37, scope: !67)
!76 = !DILocation(line: 54, column: 17, scope: !67)
!77 = distinct !{!77, !69, !78, !79}
!78 = !DILocation(line: 57, column: 17, scope: !64)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 58, column: 13, scope: !60)
!81 = !DILocation(line: 61, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !56, file: !13, line: 60, column: 13)
!83 = !DILocation(line: 65, column: 1, scope: !12)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_31_good", scope: !13, file: !13, line: 148, type: !14, scopeLine: 149, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 150, column: 5, scope: !84)
!86 = !DILocation(line: 151, column: 5, scope: !84)
!87 = !DILocation(line: 152, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 162, type: !89, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!17, !17, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !13, line: 162, type: !17)
!94 = !DILocation(line: 162, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !13, line: 162, type: !91)
!96 = !DILocation(line: 162, column: 27, scope: !88)
!97 = !DILocation(line: 165, column: 22, scope: !88)
!98 = !DILocation(line: 165, column: 12, scope: !88)
!99 = !DILocation(line: 165, column: 5, scope: !88)
!100 = !DILocation(line: 167, column: 5, scope: !88)
!101 = !DILocation(line: 168, column: 5, scope: !88)
!102 = !DILocation(line: 169, column: 5, scope: !88)
!103 = !DILocation(line: 172, column: 5, scope: !88)
!104 = !DILocation(line: 173, column: 5, scope: !88)
!105 = !DILocation(line: 174, column: 5, scope: !88)
!106 = !DILocation(line: 176, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 72, type: !14, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !13, line: 74, type: !17)
!109 = !DILocation(line: 74, column: 9, scope: !107)
!110 = !DILocation(line: 76, column: 10, scope: !107)
!111 = !DILocation(line: 79, column: 10, scope: !107)
!112 = !DILocalVariable(name: "dataCopy", scope: !113, file: !13, line: 81, type: !17)
!113 = distinct !DILexicalBlock(scope: !107, file: !13, line: 80, column: 5)
!114 = !DILocation(line: 81, column: 13, scope: !113)
!115 = !DILocation(line: 81, column: 24, scope: !113)
!116 = !DILocalVariable(name: "data", scope: !113, file: !13, line: 82, type: !17)
!117 = !DILocation(line: 82, column: 13, scope: !113)
!118 = !DILocation(line: 82, column: 20, scope: !113)
!119 = !DILocalVariable(name: "i", scope: !120, file: !13, line: 84, type: !17)
!120 = distinct !DILexicalBlock(scope: !113, file: !13, line: 83, column: 9)
!121 = !DILocation(line: 84, column: 17, scope: !120)
!122 = !DILocalVariable(name: "buffer", scope: !120, file: !13, line: 85, type: !51)
!123 = !DILocation(line: 85, column: 17, scope: !120)
!124 = !DILocation(line: 88, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !13, line: 88, column: 17)
!126 = !DILocation(line: 88, column: 22, scope: !125)
!127 = !DILocation(line: 88, column: 17, scope: !120)
!128 = !DILocation(line: 90, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 89, column: 13)
!130 = !DILocation(line: 90, column: 17, scope: !129)
!131 = !DILocation(line: 90, column: 30, scope: !129)
!132 = !DILocation(line: 92, column: 23, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !13, line: 92, column: 17)
!134 = !DILocation(line: 92, column: 21, scope: !133)
!135 = !DILocation(line: 92, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !13, line: 92, column: 17)
!137 = !DILocation(line: 92, column: 30, scope: !136)
!138 = !DILocation(line: 92, column: 17, scope: !133)
!139 = !DILocation(line: 94, column: 41, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !13, line: 93, column: 17)
!141 = !DILocation(line: 94, column: 34, scope: !140)
!142 = !DILocation(line: 94, column: 21, scope: !140)
!143 = !DILocation(line: 95, column: 17, scope: !140)
!144 = !DILocation(line: 92, column: 37, scope: !136)
!145 = !DILocation(line: 92, column: 17, scope: !136)
!146 = distinct !{!146, !138, !147, !79}
!147 = !DILocation(line: 95, column: 17, scope: !133)
!148 = !DILocation(line: 96, column: 13, scope: !129)
!149 = !DILocation(line: 99, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !125, file: !13, line: 98, column: 13)
!151 = !DILocation(line: 103, column: 1, scope: !107)
!152 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 106, type: !14, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !13, line: 108, type: !17)
!154 = !DILocation(line: 108, column: 9, scope: !152)
!155 = !DILocation(line: 110, column: 10, scope: !152)
!156 = !DILocalVariable(name: "inputBuffer", scope: !157, file: !13, line: 112, type: !22)
!157 = distinct !DILexicalBlock(scope: !152, file: !13, line: 111, column: 5)
!158 = !DILocation(line: 112, column: 14, scope: !157)
!159 = !DILocation(line: 114, column: 19, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !13, line: 114, column: 13)
!161 = !DILocation(line: 114, column: 49, scope: !160)
!162 = !DILocation(line: 114, column: 13, scope: !160)
!163 = !DILocation(line: 114, column: 56, scope: !160)
!164 = !DILocation(line: 114, column: 13, scope: !157)
!165 = !DILocation(line: 117, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !13, line: 115, column: 9)
!167 = !DILocation(line: 117, column: 20, scope: !166)
!168 = !DILocation(line: 117, column: 18, scope: !166)
!169 = !DILocation(line: 118, column: 9, scope: !166)
!170 = !DILocation(line: 121, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !160, file: !13, line: 120, column: 9)
!172 = !DILocalVariable(name: "dataCopy", scope: !173, file: !13, line: 125, type: !17)
!173 = distinct !DILexicalBlock(scope: !152, file: !13, line: 124, column: 5)
!174 = !DILocation(line: 125, column: 13, scope: !173)
!175 = !DILocation(line: 125, column: 24, scope: !173)
!176 = !DILocalVariable(name: "data", scope: !173, file: !13, line: 126, type: !17)
!177 = !DILocation(line: 126, column: 13, scope: !173)
!178 = !DILocation(line: 126, column: 20, scope: !173)
!179 = !DILocalVariable(name: "i", scope: !180, file: !13, line: 128, type: !17)
!180 = distinct !DILexicalBlock(scope: !173, file: !13, line: 127, column: 9)
!181 = !DILocation(line: 128, column: 17, scope: !180)
!182 = !DILocalVariable(name: "buffer", scope: !180, file: !13, line: 129, type: !51)
!183 = !DILocation(line: 129, column: 17, scope: !180)
!184 = !DILocation(line: 131, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !13, line: 131, column: 17)
!186 = !DILocation(line: 131, column: 22, scope: !185)
!187 = !DILocation(line: 131, column: 27, scope: !185)
!188 = !DILocation(line: 131, column: 30, scope: !185)
!189 = !DILocation(line: 131, column: 35, scope: !185)
!190 = !DILocation(line: 131, column: 17, scope: !180)
!191 = !DILocation(line: 133, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !13, line: 132, column: 13)
!193 = !DILocation(line: 133, column: 17, scope: !192)
!194 = !DILocation(line: 133, column: 30, scope: !192)
!195 = !DILocation(line: 135, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !13, line: 135, column: 17)
!197 = !DILocation(line: 135, column: 21, scope: !196)
!198 = !DILocation(line: 135, column: 28, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !13, line: 135, column: 17)
!200 = !DILocation(line: 135, column: 30, scope: !199)
!201 = !DILocation(line: 135, column: 17, scope: !196)
!202 = !DILocation(line: 137, column: 41, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !13, line: 136, column: 17)
!204 = !DILocation(line: 137, column: 34, scope: !203)
!205 = !DILocation(line: 137, column: 21, scope: !203)
!206 = !DILocation(line: 138, column: 17, scope: !203)
!207 = !DILocation(line: 135, column: 37, scope: !199)
!208 = !DILocation(line: 135, column: 17, scope: !199)
!209 = distinct !{!209, !201, !210, !79}
!210 = !DILocation(line: 138, column: 17, scope: !196)
!211 = !DILocation(line: 139, column: 13, scope: !192)
!212 = !DILocation(line: 142, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !185, file: !13, line: 141, column: 13)
!214 = !DILocation(line: 146, column: 1, scope: !152)
