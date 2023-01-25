; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_17.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_17_bad() #0 !dbg !12 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !31, metadata !DIExpression()), !dbg !38
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !41
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !42
  %cmp1 = icmp ne i8* %call, null, !dbg !43
  br i1 %cmp1, label %if.then, label %if.else, !dbg !44

if.then:                                          ; preds = %for.body
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !45
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !47
  store i32 %call3, i32* %data, align 4, !dbg !48
  br label %if.end, !dbg !49

if.else:                                          ; preds = %for.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %3, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !58
  br label %for.cond4, !dbg !60

for.cond4:                                        ; preds = %for.inc11, %for.end
  %4 = load i32, i32* %j, align 4, !dbg !61
  %cmp5 = icmp slt i32 %4, 1, !dbg !63
  br i1 %cmp5, label %for.body6, label %for.end13, !dbg !64

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !65, metadata !DIExpression()), !dbg !71
  %5 = bitcast [10 x i32]* %buffer to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false), !dbg !71
  %6 = load i32, i32* %data, align 4, !dbg !72
  %cmp7 = icmp sge i32 %6, 0, !dbg !74
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !75

if.then8:                                         ; preds = %for.body6
  %7 = load i32, i32* %data, align 4, !dbg !76
  %idxprom = sext i32 %7 to i64, !dbg !78
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !78
  %8 = load i32, i32* %arrayidx, align 4, !dbg !78
  call void @printIntLine(i32 %8), !dbg !79
  br label %if.end10, !dbg !80

if.else9:                                         ; preds = %for.body6
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %if.then8
  br label %for.inc11, !dbg !83

for.inc11:                                        ; preds = %if.end10
  %9 = load i32, i32* %j, align 4, !dbg !84
  %inc12 = add nsw i32 %9, 1, !dbg !84
  store i32 %inc12, i32* %j, align 4, !dbg !84
  br label %for.cond4, !dbg !85, !llvm.loop !86

for.end13:                                        ; preds = %for.cond4
  ret void, !dbg !88
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_17_good() #0 !dbg !89 {
entry:
  call void @goodB2G(), !dbg !90
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #7, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #7, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__CWE129_fgets_17_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__CWE129_fgets_17_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !112 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %k, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  store i32 0, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !123
  %cmp = icmp slt i32 %0, 1, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !127, metadata !DIExpression()), !dbg !130
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !130
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !131
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !133
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !134
  %cmp1 = icmp ne i8* %call, null, !dbg !135
  br i1 %cmp1, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %for.body
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !137
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !139
  store i32 %call3, i32* %data, align 4, !dbg !140
  br label %if.end, !dbg !141

if.else:                                          ; preds = %for.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !145
  %inc = add nsw i32 %3, 1, !dbg !145
  store i32 %inc, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !149
  br label %for.cond4, !dbg !151

for.cond4:                                        ; preds = %for.inc12, %for.end
  %4 = load i32, i32* %k, align 4, !dbg !152
  %cmp5 = icmp slt i32 %4, 1, !dbg !154
  br i1 %cmp5, label %for.body6, label %for.end14, !dbg !155

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !156, metadata !DIExpression()), !dbg !159
  %5 = bitcast [10 x i32]* %buffer to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false), !dbg !159
  %6 = load i32, i32* %data, align 4, !dbg !160
  %cmp7 = icmp sge i32 %6, 0, !dbg !162
  br i1 %cmp7, label %land.lhs.true, label %if.else10, !dbg !163

land.lhs.true:                                    ; preds = %for.body6
  %7 = load i32, i32* %data, align 4, !dbg !164
  %cmp8 = icmp slt i32 %7, 10, !dbg !165
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !166

if.then9:                                         ; preds = %land.lhs.true
  %8 = load i32, i32* %data, align 4, !dbg !167
  %idxprom = sext i32 %8 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !169
  %9 = load i32, i32* %arrayidx, align 4, !dbg !169
  call void @printIntLine(i32 %9), !dbg !170
  br label %if.end11, !dbg !171

if.else10:                                        ; preds = %land.lhs.true, %for.body6
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !172
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %for.inc12, !dbg !174

for.inc12:                                        ; preds = %if.end11
  %10 = load i32, i32* %k, align 4, !dbg !175
  %inc13 = add nsw i32 %10, 1, !dbg !175
  store i32 %inc13, i32* %k, align 4, !dbg !175
  br label %for.cond4, !dbg !176, !llvm.loop !177

for.end14:                                        ; preds = %for.cond4
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !180 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32* %j, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %data, metadata !185, metadata !DIExpression()), !dbg !186
  store i32 -1, i32* %data, align 4, !dbg !187
  store i32 0, i32* %h, align 4, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !191
  %cmp = icmp slt i32 %0, 1, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !195
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !198
  %inc = add nsw i32 %1, 1, !dbg !198
  store i32 %inc, i32* %h, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !202
  br label %for.cond1, !dbg !204

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !205
  %cmp2 = icmp slt i32 %2, 1, !dbg !207
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !208

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !209, metadata !DIExpression()), !dbg !212
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !212
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !212
  %4 = load i32, i32* %data, align 4, !dbg !213
  %cmp4 = icmp sge i32 %4, 0, !dbg !215
  br i1 %cmp4, label %if.then, label %if.else, !dbg !216

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !217
  %idxprom = sext i32 %5 to i64, !dbg !219
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !219
  %6 = load i32, i32* %arrayidx, align 4, !dbg !219
  call void @printIntLine(i32 %6), !dbg !220
  br label %if.end, !dbg !221

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !222
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !224

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !225
  %inc6 = add nsw i32 %7, 1, !dbg !225
  store i32 %inc6, i32* %j, align 4, !dbg !225
  br label %for.cond1, !dbg !226, !llvm.loop !227

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !229
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_17_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_17.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "i", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocalVariable(name: "j", scope: !12, file: !13, line: 26, type: !17)
!20 = !DILocation(line: 26, column: 11, scope: !12)
!21 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 27, type: !17)
!22 = !DILocation(line: 27, column: 9, scope: !12)
!23 = !DILocation(line: 29, column: 10, scope: !12)
!24 = !DILocation(line: 30, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !12, file: !13, line: 30, column: 5)
!26 = !DILocation(line: 30, column: 9, scope: !25)
!27 = !DILocation(line: 30, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !13, line: 30, column: 5)
!29 = !DILocation(line: 30, column: 18, scope: !28)
!30 = !DILocation(line: 30, column: 5, scope: !25)
!31 = !DILocalVariable(name: "inputBuffer", scope: !32, file: !13, line: 33, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !13, line: 32, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !13, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 112, elements: !36)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !{!37}
!37 = !DISubrange(count: 14)
!38 = !DILocation(line: 33, column: 18, scope: !32)
!39 = !DILocation(line: 35, column: 23, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 17)
!41 = !DILocation(line: 35, column: 53, scope: !40)
!42 = !DILocation(line: 35, column: 17, scope: !40)
!43 = !DILocation(line: 35, column: 60, scope: !40)
!44 = !DILocation(line: 35, column: 17, scope: !32)
!45 = !DILocation(line: 38, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !13, line: 36, column: 13)
!47 = !DILocation(line: 38, column: 24, scope: !46)
!48 = !DILocation(line: 38, column: 22, scope: !46)
!49 = !DILocation(line: 39, column: 13, scope: !46)
!50 = !DILocation(line: 42, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !40, file: !13, line: 41, column: 13)
!52 = !DILocation(line: 45, column: 5, scope: !33)
!53 = !DILocation(line: 30, column: 24, scope: !28)
!54 = !DILocation(line: 30, column: 5, scope: !28)
!55 = distinct !{!55, !30, !56, !57}
!56 = !DILocation(line: 45, column: 5, scope: !25)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 46, column: 11, scope: !59)
!59 = distinct !DILexicalBlock(scope: !12, file: !13, line: 46, column: 5)
!60 = !DILocation(line: 46, column: 9, scope: !59)
!61 = !DILocation(line: 46, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !13, line: 46, column: 5)
!63 = !DILocation(line: 46, column: 18, scope: !62)
!64 = !DILocation(line: 46, column: 5, scope: !59)
!65 = !DILocalVariable(name: "buffer", scope: !66, file: !13, line: 49, type: !68)
!66 = distinct !DILexicalBlock(scope: !67, file: !13, line: 48, column: 9)
!67 = distinct !DILexicalBlock(scope: !62, file: !13, line: 47, column: 5)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 10)
!71 = !DILocation(line: 49, column: 17, scope: !66)
!72 = !DILocation(line: 52, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !66, file: !13, line: 52, column: 17)
!74 = !DILocation(line: 52, column: 22, scope: !73)
!75 = !DILocation(line: 52, column: 17, scope: !66)
!76 = !DILocation(line: 54, column: 37, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !13, line: 53, column: 13)
!78 = !DILocation(line: 54, column: 30, scope: !77)
!79 = !DILocation(line: 54, column: 17, scope: !77)
!80 = !DILocation(line: 55, column: 13, scope: !77)
!81 = !DILocation(line: 58, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !13, line: 57, column: 13)
!83 = !DILocation(line: 61, column: 5, scope: !67)
!84 = !DILocation(line: 46, column: 24, scope: !62)
!85 = !DILocation(line: 46, column: 5, scope: !62)
!86 = distinct !{!86, !64, !87, !57}
!87 = !DILocation(line: 61, column: 5, scope: !59)
!88 = !DILocation(line: 62, column: 1, scope: !12)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_17_good", scope: !13, file: !13, line: 139, type: !14, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 141, column: 5, scope: !89)
!91 = !DILocation(line: 142, column: 5, scope: !89)
!92 = !DILocation(line: 143, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 154, type: !94, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!17, !17, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !13, line: 154, type: !17)
!99 = !DILocation(line: 154, column: 14, scope: !93)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !13, line: 154, type: !96)
!101 = !DILocation(line: 154, column: 27, scope: !93)
!102 = !DILocation(line: 157, column: 22, scope: !93)
!103 = !DILocation(line: 157, column: 12, scope: !93)
!104 = !DILocation(line: 157, column: 5, scope: !93)
!105 = !DILocation(line: 159, column: 5, scope: !93)
!106 = !DILocation(line: 160, column: 5, scope: !93)
!107 = !DILocation(line: 161, column: 5, scope: !93)
!108 = !DILocation(line: 164, column: 5, scope: !93)
!109 = !DILocation(line: 165, column: 5, scope: !93)
!110 = !DILocation(line: 166, column: 5, scope: !93)
!111 = !DILocation(line: 168, column: 5, scope: !93)
!112 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 69, type: !14, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "i", scope: !112, file: !13, line: 71, type: !17)
!114 = !DILocation(line: 71, column: 9, scope: !112)
!115 = !DILocalVariable(name: "k", scope: !112, file: !13, line: 71, type: !17)
!116 = !DILocation(line: 71, column: 11, scope: !112)
!117 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 72, type: !17)
!118 = !DILocation(line: 72, column: 9, scope: !112)
!119 = !DILocation(line: 74, column: 10, scope: !112)
!120 = !DILocation(line: 75, column: 11, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !13, line: 75, column: 5)
!122 = !DILocation(line: 75, column: 9, scope: !121)
!123 = !DILocation(line: 75, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !13, line: 75, column: 5)
!125 = !DILocation(line: 75, column: 18, scope: !124)
!126 = !DILocation(line: 75, column: 5, scope: !121)
!127 = !DILocalVariable(name: "inputBuffer", scope: !128, file: !13, line: 78, type: !34)
!128 = distinct !DILexicalBlock(scope: !129, file: !13, line: 77, column: 9)
!129 = distinct !DILexicalBlock(scope: !124, file: !13, line: 76, column: 5)
!130 = !DILocation(line: 78, column: 18, scope: !128)
!131 = !DILocation(line: 80, column: 23, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !13, line: 80, column: 17)
!133 = !DILocation(line: 80, column: 53, scope: !132)
!134 = !DILocation(line: 80, column: 17, scope: !132)
!135 = !DILocation(line: 80, column: 60, scope: !132)
!136 = !DILocation(line: 80, column: 17, scope: !128)
!137 = !DILocation(line: 83, column: 29, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !13, line: 81, column: 13)
!139 = !DILocation(line: 83, column: 24, scope: !138)
!140 = !DILocation(line: 83, column: 22, scope: !138)
!141 = !DILocation(line: 84, column: 13, scope: !138)
!142 = !DILocation(line: 87, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !132, file: !13, line: 86, column: 13)
!144 = !DILocation(line: 90, column: 5, scope: !129)
!145 = !DILocation(line: 75, column: 24, scope: !124)
!146 = !DILocation(line: 75, column: 5, scope: !124)
!147 = distinct !{!147, !126, !148, !57}
!148 = !DILocation(line: 90, column: 5, scope: !121)
!149 = !DILocation(line: 91, column: 11, scope: !150)
!150 = distinct !DILexicalBlock(scope: !112, file: !13, line: 91, column: 5)
!151 = !DILocation(line: 91, column: 9, scope: !150)
!152 = !DILocation(line: 91, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !13, line: 91, column: 5)
!154 = !DILocation(line: 91, column: 18, scope: !153)
!155 = !DILocation(line: 91, column: 5, scope: !150)
!156 = !DILocalVariable(name: "buffer", scope: !157, file: !13, line: 94, type: !68)
!157 = distinct !DILexicalBlock(scope: !158, file: !13, line: 93, column: 9)
!158 = distinct !DILexicalBlock(scope: !153, file: !13, line: 92, column: 5)
!159 = !DILocation(line: 94, column: 17, scope: !157)
!160 = !DILocation(line: 96, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 96, column: 17)
!162 = !DILocation(line: 96, column: 22, scope: !161)
!163 = !DILocation(line: 96, column: 27, scope: !161)
!164 = !DILocation(line: 96, column: 30, scope: !161)
!165 = !DILocation(line: 96, column: 35, scope: !161)
!166 = !DILocation(line: 96, column: 17, scope: !157)
!167 = !DILocation(line: 98, column: 37, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !13, line: 97, column: 13)
!169 = !DILocation(line: 98, column: 30, scope: !168)
!170 = !DILocation(line: 98, column: 17, scope: !168)
!171 = !DILocation(line: 99, column: 13, scope: !168)
!172 = !DILocation(line: 102, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !13, line: 101, column: 13)
!174 = !DILocation(line: 105, column: 5, scope: !158)
!175 = !DILocation(line: 91, column: 24, scope: !153)
!176 = !DILocation(line: 91, column: 5, scope: !153)
!177 = distinct !{!177, !155, !178, !57}
!178 = !DILocation(line: 105, column: 5, scope: !150)
!179 = !DILocation(line: 106, column: 1, scope: !112)
!180 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 109, type: !14, scopeLine: 110, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DILocalVariable(name: "h", scope: !180, file: !13, line: 111, type: !17)
!182 = !DILocation(line: 111, column: 9, scope: !180)
!183 = !DILocalVariable(name: "j", scope: !180, file: !13, line: 111, type: !17)
!184 = !DILocation(line: 111, column: 11, scope: !180)
!185 = !DILocalVariable(name: "data", scope: !180, file: !13, line: 112, type: !17)
!186 = !DILocation(line: 112, column: 9, scope: !180)
!187 = !DILocation(line: 114, column: 10, scope: !180)
!188 = !DILocation(line: 115, column: 11, scope: !189)
!189 = distinct !DILexicalBlock(scope: !180, file: !13, line: 115, column: 5)
!190 = !DILocation(line: 115, column: 9, scope: !189)
!191 = !DILocation(line: 115, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !13, line: 115, column: 5)
!193 = !DILocation(line: 115, column: 18, scope: !192)
!194 = !DILocation(line: 115, column: 5, scope: !189)
!195 = !DILocation(line: 119, column: 14, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !13, line: 116, column: 5)
!197 = !DILocation(line: 120, column: 5, scope: !196)
!198 = !DILocation(line: 115, column: 24, scope: !192)
!199 = !DILocation(line: 115, column: 5, scope: !192)
!200 = distinct !{!200, !194, !201, !57}
!201 = !DILocation(line: 120, column: 5, scope: !189)
!202 = !DILocation(line: 121, column: 11, scope: !203)
!203 = distinct !DILexicalBlock(scope: !180, file: !13, line: 121, column: 5)
!204 = !DILocation(line: 121, column: 9, scope: !203)
!205 = !DILocation(line: 121, column: 16, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !13, line: 121, column: 5)
!207 = !DILocation(line: 121, column: 18, scope: !206)
!208 = !DILocation(line: 121, column: 5, scope: !203)
!209 = !DILocalVariable(name: "buffer", scope: !210, file: !13, line: 124, type: !68)
!210 = distinct !DILexicalBlock(scope: !211, file: !13, line: 123, column: 9)
!211 = distinct !DILexicalBlock(scope: !206, file: !13, line: 122, column: 5)
!212 = !DILocation(line: 124, column: 17, scope: !210)
!213 = !DILocation(line: 127, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !13, line: 127, column: 17)
!215 = !DILocation(line: 127, column: 22, scope: !214)
!216 = !DILocation(line: 127, column: 17, scope: !210)
!217 = !DILocation(line: 129, column: 37, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !13, line: 128, column: 13)
!219 = !DILocation(line: 129, column: 30, scope: !218)
!220 = !DILocation(line: 129, column: 17, scope: !218)
!221 = !DILocation(line: 130, column: 13, scope: !218)
!222 = !DILocation(line: 133, column: 17, scope: !223)
!223 = distinct !DILexicalBlock(scope: !214, file: !13, line: 132, column: 13)
!224 = !DILocation(line: 136, column: 5, scope: !211)
!225 = !DILocation(line: 121, column: 24, scope: !206)
!226 = !DILocation(line: 121, column: 5, scope: !206)
!227 = distinct !{!227, !208, !228, !57}
!228 = !DILocation(line: 136, column: 5, scope: !203)
!229 = !DILocation(line: 137, column: 1, scope: !180)
