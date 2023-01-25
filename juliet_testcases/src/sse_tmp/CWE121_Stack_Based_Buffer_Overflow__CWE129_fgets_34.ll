; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  store i32 -1, i32* %data, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !27, metadata !DIExpression()), !dbg !33
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !34
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !36
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !37
  %cmp = icmp ne i8* %call, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !42
  store i32 %call2, i32* %data, align 4, !dbg !43
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !47
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !48
  store i32 %2, i32* %unionFirst, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !50, metadata !DIExpression()), !dbg !52
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !53
  %3 = load i32, i32* %unionSecond, align 4, !dbg !53
  store i32 %3, i32* %data3, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %i, metadata !54, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !57, metadata !DIExpression()), !dbg !61
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !61
  %5 = load i32, i32* %data3, align 4, !dbg !62
  %cmp4 = icmp sge i32 %5, 0, !dbg !64
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !65

if.then5:                                         ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !66
  %idxprom = sext i32 %6 to i64, !dbg !68
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !68
  store i32 1, i32* %arrayidx, align 4, !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %if.then5
  %7 = load i32, i32* %i, align 4, !dbg !73
  %cmp6 = icmp slt i32 %7, 10, !dbg !75
  br i1 %cmp6, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !77
  %idxprom7 = sext i32 %8 to i64, !dbg !79
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !79
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !79
  call void @printIntLine(i32 %9), !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !82
  %inc = add nsw i32 %10, 1, !dbg !82
  store i32 %inc, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !87

if.else9:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !90
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  call void @goodB2G(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #7, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #7, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  store i32 7, i32* %data, align 4, !dbg !120
  %0 = load i32, i32* %data, align 4, !dbg !121
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !122
  store i32 %0, i32* %unionFirst, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !127
  %1 = load i32, i32* %unionSecond, align 4, !dbg !127
  store i32 %1, i32* %data1, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !132
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !132
  %3 = load i32, i32* %data1, align 4, !dbg !133
  %cmp = icmp sge i32 %3, 0, !dbg !135
  br i1 %cmp, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !137
  %idxprom = sext i32 %4 to i64, !dbg !139
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !139
  store i32 1, i32* %arrayidx, align 4, !dbg !140
  store i32 0, i32* %i, align 4, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !144
  %cmp2 = icmp slt i32 %5, 10, !dbg !146
  br i1 %cmp2, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !148
  %idxprom3 = sext i32 %6 to i64, !dbg !150
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !150
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !150
  call void @printIntLine(i32 %7), !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %8, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !157

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !161 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion, metadata !164, metadata !DIExpression()), !dbg !165
  store i32 -1, i32* %data, align 4, !dbg !166
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !167, metadata !DIExpression()), !dbg !169
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !169
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !170
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !172
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !173
  %cmp = icmp ne i8* %call, null, !dbg !174
  br i1 %cmp, label %if.then, label %if.else, !dbg !175

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !176
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !178
  store i32 %call2, i32* %data, align 4, !dbg !179
  br label %if.end, !dbg !180

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !181
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !183
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !184
  store i32 %2, i32* %unionFirst, align 4, !dbg !185
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !186, metadata !DIExpression()), !dbg !188
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !189
  %3 = load i32, i32* %unionSecond, align 4, !dbg !189
  store i32 %3, i32* %data3, align 4, !dbg !188
  call void @llvm.dbg.declare(metadata i32* %i, metadata !190, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !194
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !194
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !194
  %5 = load i32, i32* %data3, align 4, !dbg !195
  %cmp4 = icmp sge i32 %5, 0, !dbg !197
  br i1 %cmp4, label %land.lhs.true, label %if.else10, !dbg !198

land.lhs.true:                                    ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !199
  %cmp5 = icmp slt i32 %6, 10, !dbg !200
  br i1 %cmp5, label %if.then6, label %if.else10, !dbg !201

if.then6:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data3, align 4, !dbg !202
  %idxprom = sext i32 %7 to i64, !dbg !204
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !204
  store i32 1, i32* %arrayidx, align 4, !dbg !205
  store i32 0, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.then6
  %8 = load i32, i32* %i, align 4, !dbg !209
  %cmp7 = icmp slt i32 %8, 10, !dbg !211
  br i1 %cmp7, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !213
  %idxprom8 = sext i32 %9 to i64, !dbg !215
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !215
  %10 = load i32, i32* %arrayidx9, align 4, !dbg !215
  call void @printIntLine(i32 %10), !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !218
  %inc = add nsw i32 %11, 1, !dbg !218
  store i32 %inc, i32* %i, align 4, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  br label %if.end11, !dbg !222

if.else10:                                        ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !223
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %for.end
  ret void, !dbg !225
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_bad", scope: !13, file: !13, line: 30, type: !14, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 32, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 32, column: 9, scope: !12)
!19 = !DILocalVariable(name: "myUnion", scope: !12, file: !13, line: 33, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_unionType", file: !13, line: 26, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !13, line: 22, size: 32, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !13, line: 24, baseType: !17, size: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !13, line: 25, baseType: !17, size: 32)
!25 = !DILocation(line: 33, column: 67, scope: !12)
!26 = !DILocation(line: 35, column: 10, scope: !12)
!27 = !DILocalVariable(name: "inputBuffer", scope: !28, file: !13, line: 37, type: !29)
!28 = distinct !DILexicalBlock(scope: !12, file: !13, line: 36, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 112, elements: !31)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{!32}
!32 = !DISubrange(count: 14)
!33 = !DILocation(line: 37, column: 14, scope: !28)
!34 = !DILocation(line: 39, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !13, line: 39, column: 13)
!36 = !DILocation(line: 39, column: 49, scope: !35)
!37 = !DILocation(line: 39, column: 13, scope: !35)
!38 = !DILocation(line: 39, column: 56, scope: !35)
!39 = !DILocation(line: 39, column: 13, scope: !28)
!40 = !DILocation(line: 42, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !13, line: 40, column: 9)
!42 = !DILocation(line: 42, column: 20, scope: !41)
!43 = !DILocation(line: 42, column: 18, scope: !41)
!44 = !DILocation(line: 43, column: 9, scope: !41)
!45 = !DILocation(line: 46, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !13, line: 45, column: 9)
!47 = !DILocation(line: 49, column: 26, scope: !12)
!48 = !DILocation(line: 49, column: 13, scope: !12)
!49 = !DILocation(line: 49, column: 24, scope: !12)
!50 = !DILocalVariable(name: "data", scope: !51, file: !13, line: 51, type: !17)
!51 = distinct !DILexicalBlock(scope: !12, file: !13, line: 50, column: 5)
!52 = !DILocation(line: 51, column: 13, scope: !51)
!53 = !DILocation(line: 51, column: 28, scope: !51)
!54 = !DILocalVariable(name: "i", scope: !55, file: !13, line: 53, type: !17)
!55 = distinct !DILexicalBlock(scope: !51, file: !13, line: 52, column: 9)
!56 = !DILocation(line: 53, column: 17, scope: !55)
!57 = !DILocalVariable(name: "buffer", scope: !55, file: !13, line: 54, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 10)
!61 = !DILocation(line: 54, column: 17, scope: !55)
!62 = !DILocation(line: 57, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !55, file: !13, line: 57, column: 17)
!64 = !DILocation(line: 57, column: 22, scope: !63)
!65 = !DILocation(line: 57, column: 17, scope: !55)
!66 = !DILocation(line: 59, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !13, line: 58, column: 13)
!68 = !DILocation(line: 59, column: 17, scope: !67)
!69 = !DILocation(line: 59, column: 30, scope: !67)
!70 = !DILocation(line: 61, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !13, line: 61, column: 17)
!72 = !DILocation(line: 61, column: 21, scope: !71)
!73 = !DILocation(line: 61, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !13, line: 61, column: 17)
!75 = !DILocation(line: 61, column: 30, scope: !74)
!76 = !DILocation(line: 61, column: 17, scope: !71)
!77 = !DILocation(line: 63, column: 41, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !13, line: 62, column: 17)
!79 = !DILocation(line: 63, column: 34, scope: !78)
!80 = !DILocation(line: 63, column: 21, scope: !78)
!81 = !DILocation(line: 64, column: 17, scope: !78)
!82 = !DILocation(line: 61, column: 37, scope: !74)
!83 = !DILocation(line: 61, column: 17, scope: !74)
!84 = distinct !{!84, !76, !85, !86}
!85 = !DILocation(line: 64, column: 17, scope: !71)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 65, column: 13, scope: !67)
!88 = !DILocation(line: 68, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !63, file: !13, line: 67, column: 13)
!90 = !DILocation(line: 72, column: 1, scope: !12)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_34_good", scope: !13, file: !13, line: 157, type: !14, scopeLine: 158, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 159, column: 5, scope: !91)
!93 = !DILocation(line: 160, column: 5, scope: !91)
!94 = !DILocation(line: 161, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 171, type: !96, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!17, !17, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !13, line: 171, type: !17)
!101 = !DILocation(line: 171, column: 14, scope: !95)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !13, line: 171, type: !98)
!103 = !DILocation(line: 171, column: 27, scope: !95)
!104 = !DILocation(line: 174, column: 22, scope: !95)
!105 = !DILocation(line: 174, column: 12, scope: !95)
!106 = !DILocation(line: 174, column: 5, scope: !95)
!107 = !DILocation(line: 176, column: 5, scope: !95)
!108 = !DILocation(line: 177, column: 5, scope: !95)
!109 = !DILocation(line: 178, column: 5, scope: !95)
!110 = !DILocation(line: 181, column: 5, scope: !95)
!111 = !DILocation(line: 182, column: 5, scope: !95)
!112 = !DILocation(line: 183, column: 5, scope: !95)
!113 = !DILocation(line: 185, column: 5, scope: !95)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 79, type: !14, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !13, line: 81, type: !17)
!116 = !DILocation(line: 81, column: 9, scope: !114)
!117 = !DILocalVariable(name: "myUnion", scope: !114, file: !13, line: 82, type: !20)
!118 = !DILocation(line: 82, column: 67, scope: !114)
!119 = !DILocation(line: 84, column: 10, scope: !114)
!120 = !DILocation(line: 87, column: 10, scope: !114)
!121 = !DILocation(line: 88, column: 26, scope: !114)
!122 = !DILocation(line: 88, column: 13, scope: !114)
!123 = !DILocation(line: 88, column: 24, scope: !114)
!124 = !DILocalVariable(name: "data", scope: !125, file: !13, line: 90, type: !17)
!125 = distinct !DILexicalBlock(scope: !114, file: !13, line: 89, column: 5)
!126 = !DILocation(line: 90, column: 13, scope: !125)
!127 = !DILocation(line: 90, column: 28, scope: !125)
!128 = !DILocalVariable(name: "i", scope: !129, file: !13, line: 92, type: !17)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 91, column: 9)
!130 = !DILocation(line: 92, column: 17, scope: !129)
!131 = !DILocalVariable(name: "buffer", scope: !129, file: !13, line: 93, type: !58)
!132 = !DILocation(line: 93, column: 17, scope: !129)
!133 = !DILocation(line: 96, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !13, line: 96, column: 17)
!135 = !DILocation(line: 96, column: 22, scope: !134)
!136 = !DILocation(line: 96, column: 17, scope: !129)
!137 = !DILocation(line: 98, column: 24, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !13, line: 97, column: 13)
!139 = !DILocation(line: 98, column: 17, scope: !138)
!140 = !DILocation(line: 98, column: 30, scope: !138)
!141 = !DILocation(line: 100, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !13, line: 100, column: 17)
!143 = !DILocation(line: 100, column: 21, scope: !142)
!144 = !DILocation(line: 100, column: 28, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !13, line: 100, column: 17)
!146 = !DILocation(line: 100, column: 30, scope: !145)
!147 = !DILocation(line: 100, column: 17, scope: !142)
!148 = !DILocation(line: 102, column: 41, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !13, line: 101, column: 17)
!150 = !DILocation(line: 102, column: 34, scope: !149)
!151 = !DILocation(line: 102, column: 21, scope: !149)
!152 = !DILocation(line: 103, column: 17, scope: !149)
!153 = !DILocation(line: 100, column: 37, scope: !145)
!154 = !DILocation(line: 100, column: 17, scope: !145)
!155 = distinct !{!155, !147, !156, !86}
!156 = !DILocation(line: 103, column: 17, scope: !142)
!157 = !DILocation(line: 104, column: 13, scope: !138)
!158 = !DILocation(line: 107, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !134, file: !13, line: 106, column: 13)
!160 = !DILocation(line: 111, column: 1, scope: !114)
!161 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 114, type: !14, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", scope: !161, file: !13, line: 116, type: !17)
!163 = !DILocation(line: 116, column: 9, scope: !161)
!164 = !DILocalVariable(name: "myUnion", scope: !161, file: !13, line: 117, type: !20)
!165 = !DILocation(line: 117, column: 67, scope: !161)
!166 = !DILocation(line: 119, column: 10, scope: !161)
!167 = !DILocalVariable(name: "inputBuffer", scope: !168, file: !13, line: 121, type: !29)
!168 = distinct !DILexicalBlock(scope: !161, file: !13, line: 120, column: 5)
!169 = !DILocation(line: 121, column: 14, scope: !168)
!170 = !DILocation(line: 123, column: 19, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !13, line: 123, column: 13)
!172 = !DILocation(line: 123, column: 49, scope: !171)
!173 = !DILocation(line: 123, column: 13, scope: !171)
!174 = !DILocation(line: 123, column: 56, scope: !171)
!175 = !DILocation(line: 123, column: 13, scope: !168)
!176 = !DILocation(line: 126, column: 25, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !13, line: 124, column: 9)
!178 = !DILocation(line: 126, column: 20, scope: !177)
!179 = !DILocation(line: 126, column: 18, scope: !177)
!180 = !DILocation(line: 127, column: 9, scope: !177)
!181 = !DILocation(line: 130, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !171, file: !13, line: 129, column: 9)
!183 = !DILocation(line: 133, column: 26, scope: !161)
!184 = !DILocation(line: 133, column: 13, scope: !161)
!185 = !DILocation(line: 133, column: 24, scope: !161)
!186 = !DILocalVariable(name: "data", scope: !187, file: !13, line: 135, type: !17)
!187 = distinct !DILexicalBlock(scope: !161, file: !13, line: 134, column: 5)
!188 = !DILocation(line: 135, column: 13, scope: !187)
!189 = !DILocation(line: 135, column: 28, scope: !187)
!190 = !DILocalVariable(name: "i", scope: !191, file: !13, line: 137, type: !17)
!191 = distinct !DILexicalBlock(scope: !187, file: !13, line: 136, column: 9)
!192 = !DILocation(line: 137, column: 17, scope: !191)
!193 = !DILocalVariable(name: "buffer", scope: !191, file: !13, line: 138, type: !58)
!194 = !DILocation(line: 138, column: 17, scope: !191)
!195 = !DILocation(line: 140, column: 17, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !13, line: 140, column: 17)
!197 = !DILocation(line: 140, column: 22, scope: !196)
!198 = !DILocation(line: 140, column: 27, scope: !196)
!199 = !DILocation(line: 140, column: 30, scope: !196)
!200 = !DILocation(line: 140, column: 35, scope: !196)
!201 = !DILocation(line: 140, column: 17, scope: !191)
!202 = !DILocation(line: 142, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !196, file: !13, line: 141, column: 13)
!204 = !DILocation(line: 142, column: 17, scope: !203)
!205 = !DILocation(line: 142, column: 30, scope: !203)
!206 = !DILocation(line: 144, column: 23, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !13, line: 144, column: 17)
!208 = !DILocation(line: 144, column: 21, scope: !207)
!209 = !DILocation(line: 144, column: 28, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !13, line: 144, column: 17)
!211 = !DILocation(line: 144, column: 30, scope: !210)
!212 = !DILocation(line: 144, column: 17, scope: !207)
!213 = !DILocation(line: 146, column: 41, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !13, line: 145, column: 17)
!215 = !DILocation(line: 146, column: 34, scope: !214)
!216 = !DILocation(line: 146, column: 21, scope: !214)
!217 = !DILocation(line: 147, column: 17, scope: !214)
!218 = !DILocation(line: 144, column: 37, scope: !210)
!219 = !DILocation(line: 144, column: 17, scope: !210)
!220 = distinct !{!220, !212, !221, !86}
!221 = !DILocation(line: 147, column: 17, scope: !207)
!222 = !DILocation(line: 148, column: 13, scope: !203)
!223 = !DILocation(line: 151, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !196, file: !13, line: 150, column: 13)
!225 = !DILocation(line: 155, column: 1, scope: !161)
