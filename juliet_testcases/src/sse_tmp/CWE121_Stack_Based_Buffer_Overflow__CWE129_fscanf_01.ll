; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !19
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !24, metadata !DIExpression()), !dbg !28
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !28
  %2 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp sge i32 %2, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %3 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  store i32 1, i32* %arrayidx, align 4, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !40
  %cmp1 = icmp slt i32 %4, 10, !dbg !42
  br i1 %cmp1, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !44
  %idxprom2 = sext i32 %5 to i64, !dbg !46
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !46
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !46
  call void @printIntLine(i32 %6), !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %7, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !54

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  call void @goodB2G(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 -1, i32* %data, align 4, !dbg !85
  store i32 7, i32* %data, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %i, metadata !87, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !91
  %1 = load i32, i32* %data, align 4, !dbg !92
  %cmp = icmp sge i32 %1, 0, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !96
  %idxprom = sext i32 %2 to i64, !dbg !98
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !98
  store i32 1, i32* %arrayidx, align 4, !dbg !99
  store i32 0, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !103
  %cmp1 = icmp slt i32 %3, 10, !dbg !105
  br i1 %cmp1, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !107
  %idxprom2 = sext i32 %4 to i64, !dbg !109
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !109
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !109
  call void @printIntLine(i32 %5), !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !112
  %inc = add nsw i32 %6, 1, !dbg !112
  store i32 %inc, i32* %i, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !120 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i32 -1, i32* %data, align 4, !dbg !123
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !124
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !125
  call void @llvm.dbg.declare(metadata i32* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !129, metadata !DIExpression()), !dbg !130
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !130
  %2 = load i32, i32* %data, align 4, !dbg !131
  %cmp = icmp sge i32 %2, 0, !dbg !133
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !134

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !135
  %cmp1 = icmp slt i32 %3, 10, !dbg !136
  br i1 %cmp1, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !138
  %idxprom = sext i32 %4 to i64, !dbg !140
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !140
  store i32 1, i32* %arrayidx, align 4, !dbg !141
  store i32 0, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !145
  %cmp2 = icmp slt i32 %5, 10, !dbg !147
  br i1 %cmp2, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !149
  %idxprom3 = sext i32 %6 to i64, !dbg !151
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !151
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !151
  call void @printIntLine(i32 %7), !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !154
  %inc = add nsw i32 %8, 1, !dbg !154
  store i32 %inc, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !158

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !159
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !161
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 28, column: 12, scope: !11)
!20 = !DILocation(line: 28, column: 5, scope: !11)
!21 = !DILocalVariable(name: "i", scope: !22, file: !12, line: 30, type: !16)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!23 = !DILocation(line: 30, column: 13, scope: !22)
!24 = !DILocalVariable(name: "buffer", scope: !22, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !22)
!29 = !DILocation(line: 34, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !12, line: 34, column: 13)
!31 = !DILocation(line: 34, column: 18, scope: !30)
!32 = !DILocation(line: 34, column: 13, scope: !22)
!33 = !DILocation(line: 36, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 35, column: 9)
!35 = !DILocation(line: 36, column: 13, scope: !34)
!36 = !DILocation(line: 36, column: 26, scope: !34)
!37 = !DILocation(line: 38, column: 19, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 38, column: 13)
!39 = !DILocation(line: 38, column: 17, scope: !38)
!40 = !DILocation(line: 38, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 38, column: 13)
!42 = !DILocation(line: 38, column: 26, scope: !41)
!43 = !DILocation(line: 38, column: 13, scope: !38)
!44 = !DILocation(line: 40, column: 37, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 39, column: 13)
!46 = !DILocation(line: 40, column: 30, scope: !45)
!47 = !DILocation(line: 40, column: 17, scope: !45)
!48 = !DILocation(line: 41, column: 13, scope: !45)
!49 = !DILocation(line: 38, column: 33, scope: !41)
!50 = !DILocation(line: 38, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 41, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 42, column: 9, scope: !34)
!55 = !DILocation(line: 45, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !30, file: !12, line: 44, column: 9)
!57 = !DILocation(line: 48, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 114, column: 5, scope: !58)
!60 = !DILocation(line: 115, column: 5, scope: !58)
!61 = !DILocation(line: 116, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !63, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!16, !16, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 127, type: !16)
!69 = !DILocation(line: 127, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 127, type: !65)
!71 = !DILocation(line: 127, column: 27, scope: !62)
!72 = !DILocation(line: 130, column: 22, scope: !62)
!73 = !DILocation(line: 130, column: 12, scope: !62)
!74 = !DILocation(line: 130, column: 5, scope: !62)
!75 = !DILocation(line: 132, column: 5, scope: !62)
!76 = !DILocation(line: 133, column: 5, scope: !62)
!77 = !DILocation(line: 134, column: 5, scope: !62)
!78 = !DILocation(line: 137, column: 5, scope: !62)
!79 = !DILocation(line: 138, column: 5, scope: !62)
!80 = !DILocation(line: 139, column: 5, scope: !62)
!81 = !DILocation(line: 141, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 57, type: !16)
!84 = !DILocation(line: 57, column: 9, scope: !82)
!85 = !DILocation(line: 59, column: 10, scope: !82)
!86 = !DILocation(line: 62, column: 10, scope: !82)
!87 = !DILocalVariable(name: "i", scope: !88, file: !12, line: 64, type: !16)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 63, column: 5)
!89 = !DILocation(line: 64, column: 13, scope: !88)
!90 = !DILocalVariable(name: "buffer", scope: !88, file: !12, line: 65, type: !25)
!91 = !DILocation(line: 65, column: 13, scope: !88)
!92 = !DILocation(line: 68, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !12, line: 68, column: 13)
!94 = !DILocation(line: 68, column: 18, scope: !93)
!95 = !DILocation(line: 68, column: 13, scope: !88)
!96 = !DILocation(line: 70, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 69, column: 9)
!98 = !DILocation(line: 70, column: 13, scope: !97)
!99 = !DILocation(line: 70, column: 26, scope: !97)
!100 = !DILocation(line: 72, column: 19, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 72, column: 13)
!102 = !DILocation(line: 72, column: 17, scope: !101)
!103 = !DILocation(line: 72, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 72, column: 13)
!105 = !DILocation(line: 72, column: 26, scope: !104)
!106 = !DILocation(line: 72, column: 13, scope: !101)
!107 = !DILocation(line: 74, column: 37, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 73, column: 13)
!109 = !DILocation(line: 74, column: 30, scope: !108)
!110 = !DILocation(line: 74, column: 17, scope: !108)
!111 = !DILocation(line: 75, column: 13, scope: !108)
!112 = !DILocation(line: 72, column: 33, scope: !104)
!113 = !DILocation(line: 72, column: 13, scope: !104)
!114 = distinct !{!114, !106, !115, !53}
!115 = !DILocation(line: 75, column: 13, scope: !101)
!116 = !DILocation(line: 76, column: 9, scope: !97)
!117 = !DILocation(line: 79, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !93, file: !12, line: 78, column: 9)
!119 = !DILocation(line: 82, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 87, type: !16)
!122 = !DILocation(line: 87, column: 9, scope: !120)
!123 = !DILocation(line: 89, column: 10, scope: !120)
!124 = !DILocation(line: 91, column: 12, scope: !120)
!125 = !DILocation(line: 91, column: 5, scope: !120)
!126 = !DILocalVariable(name: "i", scope: !127, file: !12, line: 93, type: !16)
!127 = distinct !DILexicalBlock(scope: !120, file: !12, line: 92, column: 5)
!128 = !DILocation(line: 93, column: 13, scope: !127)
!129 = !DILocalVariable(name: "buffer", scope: !127, file: !12, line: 94, type: !25)
!130 = !DILocation(line: 94, column: 13, scope: !127)
!131 = !DILocation(line: 96, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !12, line: 96, column: 13)
!133 = !DILocation(line: 96, column: 18, scope: !132)
!134 = !DILocation(line: 96, column: 23, scope: !132)
!135 = !DILocation(line: 96, column: 26, scope: !132)
!136 = !DILocation(line: 96, column: 31, scope: !132)
!137 = !DILocation(line: 96, column: 13, scope: !127)
!138 = !DILocation(line: 98, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !12, line: 97, column: 9)
!140 = !DILocation(line: 98, column: 13, scope: !139)
!141 = !DILocation(line: 98, column: 26, scope: !139)
!142 = !DILocation(line: 100, column: 19, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 100, column: 13)
!144 = !DILocation(line: 100, column: 17, scope: !143)
!145 = !DILocation(line: 100, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 100, column: 13)
!147 = !DILocation(line: 100, column: 26, scope: !146)
!148 = !DILocation(line: 100, column: 13, scope: !143)
!149 = !DILocation(line: 102, column: 37, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 101, column: 13)
!151 = !DILocation(line: 102, column: 30, scope: !150)
!152 = !DILocation(line: 102, column: 17, scope: !150)
!153 = !DILocation(line: 103, column: 13, scope: !150)
!154 = !DILocation(line: 100, column: 33, scope: !146)
!155 = !DILocation(line: 100, column: 13, scope: !146)
!156 = distinct !{!156, !148, !157, !53}
!157 = !DILocation(line: 103, column: 13, scope: !143)
!158 = !DILocation(line: 104, column: 9, scope: !139)
!159 = !DILocation(line: 107, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !132, file: !12, line: 106, column: 9)
!161 = !DILocation(line: 110, column: 1, scope: !120)
