; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %while.body, !dbg !19

while.body:                                       ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !20
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !22
  br label %while.end, !dbg !23

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !24

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !29, metadata !DIExpression()), !dbg !33
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !33
  %2 = load i32, i32* %data, align 4, !dbg !34
  %cmp = icmp sge i32 %2, 0, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %while.body1
  %3 = load i32, i32* %data, align 4, !dbg !38
  %idxprom = sext i32 %3 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  store i32 1, i32* %arrayidx, align 4, !dbg !41
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !45
  %cmp2 = icmp slt i32 %4, 10, !dbg !47
  br i1 %cmp2, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !49
  %idxprom3 = sext i32 %5 to i64, !dbg !51
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !51
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !51
  call void @printIntLine(i32 %6), !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %7, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !59

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !62

while.end5:                                       ; preds = %if.end
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16_good() #0 !dbg !64 {
entry:
  call void @goodB2G(), !dbg !65
  call void @goodG2B(), !dbg !66
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  br label %while.body, !dbg !92

while.body:                                       ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !93
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !95
  br label %while.end, !dbg !96

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !97

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !98, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !102, metadata !DIExpression()), !dbg !103
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !103
  %2 = load i32, i32* %data, align 4, !dbg !104
  %cmp = icmp sge i32 %2, 0, !dbg !106
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !107

land.lhs.true:                                    ; preds = %while.body1
  %3 = load i32, i32* %data, align 4, !dbg !108
  %cmp2 = icmp slt i32 %3, 10, !dbg !109
  br i1 %cmp2, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !111
  %idxprom = sext i32 %4 to i64, !dbg !113
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !113
  store i32 1, i32* %arrayidx, align 4, !dbg !114
  store i32 0, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !118
  %cmp3 = icmp slt i32 %5, 10, !dbg !120
  br i1 %cmp3, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !122
  %idxprom4 = sext i32 %6 to i64, !dbg !124
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !124
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !124
  call void @printIntLine(i32 %7), !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !127
  %inc = add nsw i32 %8, 1, !dbg !127
  store i32 %inc, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !131

if.else:                                          ; preds = %land.lhs.true, %while.body1
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end6, !dbg !134

while.end6:                                       ; preds = %if.end
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !136 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !137, metadata !DIExpression()), !dbg !138
  store i32 -1, i32* %data, align 4, !dbg !139
  br label %while.body, !dbg !140

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !141
  br label %while.end, !dbg !143

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !144

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !145, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !150
  %1 = load i32, i32* %data, align 4, !dbg !151
  %cmp = icmp sge i32 %1, 0, !dbg !153
  br i1 %cmp, label %if.then, label %if.else, !dbg !154

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !155
  %idxprom = sext i32 %2 to i64, !dbg !157
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !157
  store i32 1, i32* %arrayidx, align 4, !dbg !158
  store i32 0, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !162
  %cmp2 = icmp slt i32 %3, 10, !dbg !164
  br i1 %cmp2, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !166
  %idxprom3 = sext i32 %4 to i64, !dbg !168
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !168
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !168
  call void @printIntLine(i32 %5), !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !171
  %inc = add nsw i32 %6, 1, !dbg !171
  store i32 %inc, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !175

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !176
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !178

while.end5:                                       ; preds = %if.end
  ret void, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 5, scope: !11)
!20 = !DILocation(line: 30, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!22 = !DILocation(line: 30, column: 9, scope: !21)
!23 = !DILocation(line: 31, column: 9, scope: !21)
!24 = !DILocation(line: 33, column: 5, scope: !11)
!25 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 36, type: !16)
!26 = distinct !DILexicalBlock(scope: !27, file: !12, line: 35, column: 9)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!28 = !DILocation(line: 36, column: 17, scope: !26)
!29 = !DILocalVariable(name: "buffer", scope: !26, file: !12, line: 37, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 37, column: 17, scope: !26)
!34 = !DILocation(line: 40, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !12, line: 40, column: 17)
!36 = !DILocation(line: 40, column: 22, scope: !35)
!37 = !DILocation(line: 40, column: 17, scope: !26)
!38 = !DILocation(line: 42, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 41, column: 13)
!40 = !DILocation(line: 42, column: 17, scope: !39)
!41 = !DILocation(line: 42, column: 30, scope: !39)
!42 = !DILocation(line: 44, column: 23, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 44, column: 17)
!44 = !DILocation(line: 44, column: 21, scope: !43)
!45 = !DILocation(line: 44, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 44, column: 17)
!47 = !DILocation(line: 44, column: 30, scope: !46)
!48 = !DILocation(line: 44, column: 17, scope: !43)
!49 = !DILocation(line: 46, column: 41, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 45, column: 17)
!51 = !DILocation(line: 46, column: 34, scope: !50)
!52 = !DILocation(line: 46, column: 21, scope: !50)
!53 = !DILocation(line: 47, column: 17, scope: !50)
!54 = !DILocation(line: 44, column: 37, scope: !46)
!55 = !DILocation(line: 44, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 47, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 48, column: 13, scope: !39)
!60 = !DILocation(line: 51, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !35, file: !12, line: 50, column: 13)
!62 = !DILocation(line: 54, column: 9, scope: !27)
!63 = !DILocation(line: 56, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_16_good", scope: !12, file: !12, line: 136, type: !13, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 138, column: 5, scope: !64)
!66 = !DILocation(line: 139, column: 5, scope: !64)
!67 = !DILocation(line: 140, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 151, type: !69, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!16, !16, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 151, type: !16)
!75 = !DILocation(line: 151, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 151, type: !71)
!77 = !DILocation(line: 151, column: 27, scope: !68)
!78 = !DILocation(line: 154, column: 22, scope: !68)
!79 = !DILocation(line: 154, column: 12, scope: !68)
!80 = !DILocation(line: 154, column: 5, scope: !68)
!81 = !DILocation(line: 156, column: 5, scope: !68)
!82 = !DILocation(line: 157, column: 5, scope: !68)
!83 = !DILocation(line: 158, column: 5, scope: !68)
!84 = !DILocation(line: 161, column: 5, scope: !68)
!85 = !DILocation(line: 162, column: 5, scope: !68)
!86 = !DILocation(line: 163, column: 5, scope: !68)
!87 = !DILocation(line: 165, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 65, type: !16)
!90 = !DILocation(line: 65, column: 9, scope: !88)
!91 = !DILocation(line: 67, column: 10, scope: !88)
!92 = !DILocation(line: 68, column: 5, scope: !88)
!93 = !DILocation(line: 71, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !12, line: 69, column: 5)
!95 = !DILocation(line: 71, column: 9, scope: !94)
!96 = !DILocation(line: 72, column: 9, scope: !94)
!97 = !DILocation(line: 74, column: 5, scope: !88)
!98 = !DILocalVariable(name: "i", scope: !99, file: !12, line: 77, type: !16)
!99 = distinct !DILexicalBlock(scope: !100, file: !12, line: 76, column: 9)
!100 = distinct !DILexicalBlock(scope: !88, file: !12, line: 75, column: 5)
!101 = !DILocation(line: 77, column: 17, scope: !99)
!102 = !DILocalVariable(name: "buffer", scope: !99, file: !12, line: 78, type: !30)
!103 = !DILocation(line: 78, column: 17, scope: !99)
!104 = !DILocation(line: 80, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !12, line: 80, column: 17)
!106 = !DILocation(line: 80, column: 22, scope: !105)
!107 = !DILocation(line: 80, column: 27, scope: !105)
!108 = !DILocation(line: 80, column: 30, scope: !105)
!109 = !DILocation(line: 80, column: 35, scope: !105)
!110 = !DILocation(line: 80, column: 17, scope: !99)
!111 = !DILocation(line: 82, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 81, column: 13)
!113 = !DILocation(line: 82, column: 17, scope: !112)
!114 = !DILocation(line: 82, column: 30, scope: !112)
!115 = !DILocation(line: 84, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 84, column: 17)
!117 = !DILocation(line: 84, column: 21, scope: !116)
!118 = !DILocation(line: 84, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 84, column: 17)
!120 = !DILocation(line: 84, column: 30, scope: !119)
!121 = !DILocation(line: 84, column: 17, scope: !116)
!122 = !DILocation(line: 86, column: 41, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 85, column: 17)
!124 = !DILocation(line: 86, column: 34, scope: !123)
!125 = !DILocation(line: 86, column: 21, scope: !123)
!126 = !DILocation(line: 87, column: 17, scope: !123)
!127 = !DILocation(line: 84, column: 37, scope: !119)
!128 = !DILocation(line: 84, column: 17, scope: !119)
!129 = distinct !{!129, !121, !130, !58}
!130 = !DILocation(line: 87, column: 17, scope: !116)
!131 = !DILocation(line: 88, column: 13, scope: !112)
!132 = !DILocation(line: 91, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !105, file: !12, line: 90, column: 13)
!134 = !DILocation(line: 94, column: 9, scope: !100)
!135 = !DILocation(line: 96, column: 1, scope: !88)
!136 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 101, type: !16)
!138 = !DILocation(line: 101, column: 9, scope: !136)
!139 = !DILocation(line: 103, column: 10, scope: !136)
!140 = !DILocation(line: 104, column: 5, scope: !136)
!141 = !DILocation(line: 108, column: 14, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !12, line: 105, column: 5)
!143 = !DILocation(line: 109, column: 9, scope: !142)
!144 = !DILocation(line: 111, column: 5, scope: !136)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 114, type: !16)
!146 = distinct !DILexicalBlock(scope: !147, file: !12, line: 113, column: 9)
!147 = distinct !DILexicalBlock(scope: !136, file: !12, line: 112, column: 5)
!148 = !DILocation(line: 114, column: 17, scope: !146)
!149 = !DILocalVariable(name: "buffer", scope: !146, file: !12, line: 115, type: !30)
!150 = !DILocation(line: 115, column: 17, scope: !146)
!151 = !DILocation(line: 118, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !12, line: 118, column: 17)
!153 = !DILocation(line: 118, column: 22, scope: !152)
!154 = !DILocation(line: 118, column: 17, scope: !146)
!155 = !DILocation(line: 120, column: 24, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !12, line: 119, column: 13)
!157 = !DILocation(line: 120, column: 17, scope: !156)
!158 = !DILocation(line: 120, column: 30, scope: !156)
!159 = !DILocation(line: 122, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !12, line: 122, column: 17)
!161 = !DILocation(line: 122, column: 21, scope: !160)
!162 = !DILocation(line: 122, column: 28, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 122, column: 17)
!164 = !DILocation(line: 122, column: 30, scope: !163)
!165 = !DILocation(line: 122, column: 17, scope: !160)
!166 = !DILocation(line: 124, column: 41, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 123, column: 17)
!168 = !DILocation(line: 124, column: 34, scope: !167)
!169 = !DILocation(line: 124, column: 21, scope: !167)
!170 = !DILocation(line: 125, column: 17, scope: !167)
!171 = !DILocation(line: 122, column: 37, scope: !163)
!172 = !DILocation(line: 122, column: 17, scope: !163)
!173 = distinct !{!173, !165, !174, !58}
!174 = !DILocation(line: 125, column: 17, scope: !160)
!175 = !DILocation(line: 126, column: 13, scope: !156)
!176 = !DILocation(line: 129, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !152, file: !12, line: 128, column: 13)
!178 = !DILocation(line: 132, column: 9, scope: !147)
!179 = !DILocation(line: 134, column: 1, scope: !136)
