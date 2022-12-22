; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 10, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !20, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* %data, align 4, !dbg !23
  store i32 %0, i32* %dataCopy, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !24, metadata !DIExpression()), !dbg !25
  %1 = load i32, i32* %dataCopy, align 4, !dbg !26
  store i32 %1, i32* %data1, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !30, metadata !DIExpression()), !dbg !34
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !34
  %3 = load i32, i32* %data1, align 4, !dbg !35
  %cmp = icmp sge i32 %3, 0, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !39
  %idxprom = sext i32 %4 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  store i32 1, i32* %arrayidx, align 4, !dbg !42
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !46
  %cmp2 = icmp slt i32 %5, 10, !dbg !48
  br i1 %cmp2, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !50
  %idxprom3 = sext i32 %6 to i64, !dbg !52
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !52
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !52
  call void @printIntLine(i32 %7), !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !55
  %inc = add nsw i32 %8, 1, !dbg !55
  store i32 %inc, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !60

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !61
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  call void @goodB2G(), !dbg !66
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  store i32 7, i32* %data, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = load i32, i32* %data, align 4, !dbg !96
  store i32 %0, i32* %dataCopy, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !97, metadata !DIExpression()), !dbg !98
  %1 = load i32, i32* %dataCopy, align 4, !dbg !99
  store i32 %1, i32* %data1, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !100, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !104
  %3 = load i32, i32* %data1, align 4, !dbg !105
  %cmp = icmp sge i32 %3, 0, !dbg !107
  br i1 %cmp, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !109
  %idxprom = sext i32 %4 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !111
  store i32 1, i32* %arrayidx, align 4, !dbg !112
  store i32 0, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !116
  %cmp2 = icmp slt i32 %5, 10, !dbg !118
  br i1 %cmp2, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !120
  %idxprom3 = sext i32 %6 to i64, !dbg !122
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !122
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !122
  call void @printIntLine(i32 %7), !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !125
  %inc = add nsw i32 %8, 1, !dbg !125
  store i32 %inc, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !129

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !133 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 -1, i32* %data, align 4, !dbg !136
  store i32 10, i32* %data, align 4, !dbg !137
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !138, metadata !DIExpression()), !dbg !140
  %0 = load i32, i32* %data, align 4, !dbg !141
  store i32 %0, i32* %dataCopy, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !142, metadata !DIExpression()), !dbg !143
  %1 = load i32, i32* %dataCopy, align 4, !dbg !144
  store i32 %1, i32* %data1, align 4, !dbg !143
  call void @llvm.dbg.declare(metadata i32* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !148, metadata !DIExpression()), !dbg !149
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !149
  %3 = load i32, i32* %data1, align 4, !dbg !150
  %cmp = icmp sge i32 %3, 0, !dbg !152
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !153

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !154
  %cmp2 = icmp slt i32 %4, 10, !dbg !155
  br i1 %cmp2, label %if.then, label %if.else, !dbg !156

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data1, align 4, !dbg !157
  %idxprom = sext i32 %5 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !159
  store i32 1, i32* %arrayidx, align 4, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !164
  %cmp3 = icmp slt i32 %6, 10, !dbg !166
  br i1 %cmp3, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !168
  %idxprom4 = sext i32 %7 to i64, !dbg !170
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !170
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !170
  call void @printIntLine(i32 %8), !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %9, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !177

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !178
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 28, column: 10, scope: !11)
!20 = !DILocalVariable(name: "dataCopy", scope: !21, file: !12, line: 30, type: !16)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!22 = !DILocation(line: 30, column: 13, scope: !21)
!23 = !DILocation(line: 30, column: 24, scope: !21)
!24 = !DILocalVariable(name: "data", scope: !21, file: !12, line: 31, type: !16)
!25 = !DILocation(line: 31, column: 13, scope: !21)
!26 = !DILocation(line: 31, column: 20, scope: !21)
!27 = !DILocalVariable(name: "i", scope: !28, file: !12, line: 33, type: !16)
!28 = distinct !DILexicalBlock(scope: !21, file: !12, line: 32, column: 9)
!29 = !DILocation(line: 33, column: 17, scope: !28)
!30 = !DILocalVariable(name: "buffer", scope: !28, file: !12, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 34, column: 17, scope: !28)
!35 = !DILocation(line: 37, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !12, line: 37, column: 17)
!37 = !DILocation(line: 37, column: 22, scope: !36)
!38 = !DILocation(line: 37, column: 17, scope: !28)
!39 = !DILocation(line: 39, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 38, column: 13)
!41 = !DILocation(line: 39, column: 17, scope: !40)
!42 = !DILocation(line: 39, column: 30, scope: !40)
!43 = !DILocation(line: 41, column: 23, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 41, column: 17)
!45 = !DILocation(line: 41, column: 21, scope: !44)
!46 = !DILocation(line: 41, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 41, column: 17)
!48 = !DILocation(line: 41, column: 30, scope: !47)
!49 = !DILocation(line: 41, column: 17, scope: !44)
!50 = !DILocation(line: 43, column: 41, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !12, line: 42, column: 17)
!52 = !DILocation(line: 43, column: 34, scope: !51)
!53 = !DILocation(line: 43, column: 21, scope: !51)
!54 = !DILocation(line: 44, column: 17, scope: !51)
!55 = !DILocation(line: 41, column: 37, scope: !47)
!56 = !DILocation(line: 41, column: 17, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 44, column: 17, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 45, column: 13, scope: !40)
!61 = !DILocation(line: 48, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !36, file: !12, line: 47, column: 13)
!63 = !DILocation(line: 52, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_31_good", scope: !12, file: !12, line: 124, type: !13, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 126, column: 5, scope: !64)
!66 = !DILocation(line: 127, column: 5, scope: !64)
!67 = !DILocation(line: 128, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 138, type: !69, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!16, !16, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 138, type: !16)
!75 = !DILocation(line: 138, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 138, type: !71)
!77 = !DILocation(line: 138, column: 27, scope: !68)
!78 = !DILocation(line: 141, column: 22, scope: !68)
!79 = !DILocation(line: 141, column: 12, scope: !68)
!80 = !DILocation(line: 141, column: 5, scope: !68)
!81 = !DILocation(line: 143, column: 5, scope: !68)
!82 = !DILocation(line: 144, column: 5, scope: !68)
!83 = !DILocation(line: 145, column: 5, scope: !68)
!84 = !DILocation(line: 148, column: 5, scope: !68)
!85 = !DILocation(line: 149, column: 5, scope: !68)
!86 = !DILocation(line: 150, column: 5, scope: !68)
!87 = !DILocation(line: 152, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 61, type: !16)
!90 = !DILocation(line: 61, column: 9, scope: !88)
!91 = !DILocation(line: 63, column: 10, scope: !88)
!92 = !DILocation(line: 66, column: 10, scope: !88)
!93 = !DILocalVariable(name: "dataCopy", scope: !94, file: !12, line: 68, type: !16)
!94 = distinct !DILexicalBlock(scope: !88, file: !12, line: 67, column: 5)
!95 = !DILocation(line: 68, column: 13, scope: !94)
!96 = !DILocation(line: 68, column: 24, scope: !94)
!97 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 69, type: !16)
!98 = !DILocation(line: 69, column: 13, scope: !94)
!99 = !DILocation(line: 69, column: 20, scope: !94)
!100 = !DILocalVariable(name: "i", scope: !101, file: !12, line: 71, type: !16)
!101 = distinct !DILexicalBlock(scope: !94, file: !12, line: 70, column: 9)
!102 = !DILocation(line: 71, column: 17, scope: !101)
!103 = !DILocalVariable(name: "buffer", scope: !101, file: !12, line: 72, type: !31)
!104 = !DILocation(line: 72, column: 17, scope: !101)
!105 = !DILocation(line: 75, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !12, line: 75, column: 17)
!107 = !DILocation(line: 75, column: 22, scope: !106)
!108 = !DILocation(line: 75, column: 17, scope: !101)
!109 = !DILocation(line: 77, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !12, line: 76, column: 13)
!111 = !DILocation(line: 77, column: 17, scope: !110)
!112 = !DILocation(line: 77, column: 30, scope: !110)
!113 = !DILocation(line: 79, column: 23, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 79, column: 17)
!115 = !DILocation(line: 79, column: 21, scope: !114)
!116 = !DILocation(line: 79, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 79, column: 17)
!118 = !DILocation(line: 79, column: 30, scope: !117)
!119 = !DILocation(line: 79, column: 17, scope: !114)
!120 = !DILocation(line: 81, column: 41, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 80, column: 17)
!122 = !DILocation(line: 81, column: 34, scope: !121)
!123 = !DILocation(line: 81, column: 21, scope: !121)
!124 = !DILocation(line: 82, column: 17, scope: !121)
!125 = !DILocation(line: 79, column: 37, scope: !117)
!126 = !DILocation(line: 79, column: 17, scope: !117)
!127 = distinct !{!127, !119, !128, !59}
!128 = !DILocation(line: 82, column: 17, scope: !114)
!129 = !DILocation(line: 83, column: 13, scope: !110)
!130 = !DILocation(line: 86, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !106, file: !12, line: 85, column: 13)
!132 = !DILocation(line: 90, column: 1, scope: !88)
!133 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !12, line: 95, type: !16)
!135 = !DILocation(line: 95, column: 9, scope: !133)
!136 = !DILocation(line: 97, column: 10, scope: !133)
!137 = !DILocation(line: 99, column: 10, scope: !133)
!138 = !DILocalVariable(name: "dataCopy", scope: !139, file: !12, line: 101, type: !16)
!139 = distinct !DILexicalBlock(scope: !133, file: !12, line: 100, column: 5)
!140 = !DILocation(line: 101, column: 13, scope: !139)
!141 = !DILocation(line: 101, column: 24, scope: !139)
!142 = !DILocalVariable(name: "data", scope: !139, file: !12, line: 102, type: !16)
!143 = !DILocation(line: 102, column: 13, scope: !139)
!144 = !DILocation(line: 102, column: 20, scope: !139)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 104, type: !16)
!146 = distinct !DILexicalBlock(scope: !139, file: !12, line: 103, column: 9)
!147 = !DILocation(line: 104, column: 17, scope: !146)
!148 = !DILocalVariable(name: "buffer", scope: !146, file: !12, line: 105, type: !31)
!149 = !DILocation(line: 105, column: 17, scope: !146)
!150 = !DILocation(line: 107, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !12, line: 107, column: 17)
!152 = !DILocation(line: 107, column: 22, scope: !151)
!153 = !DILocation(line: 107, column: 27, scope: !151)
!154 = !DILocation(line: 107, column: 30, scope: !151)
!155 = !DILocation(line: 107, column: 35, scope: !151)
!156 = !DILocation(line: 107, column: 17, scope: !146)
!157 = !DILocation(line: 109, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !12, line: 108, column: 13)
!159 = !DILocation(line: 109, column: 17, scope: !158)
!160 = !DILocation(line: 109, column: 30, scope: !158)
!161 = !DILocation(line: 111, column: 23, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 111, column: 17)
!163 = !DILocation(line: 111, column: 21, scope: !162)
!164 = !DILocation(line: 111, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 111, column: 17)
!166 = !DILocation(line: 111, column: 30, scope: !165)
!167 = !DILocation(line: 111, column: 17, scope: !162)
!168 = !DILocation(line: 113, column: 41, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 112, column: 17)
!170 = !DILocation(line: 113, column: 34, scope: !169)
!171 = !DILocation(line: 113, column: 21, scope: !169)
!172 = !DILocation(line: 114, column: 17, scope: !169)
!173 = !DILocation(line: 111, column: 37, scope: !165)
!174 = !DILocation(line: 111, column: 17, scope: !165)
!175 = distinct !{!175, !167, !176, !59}
!176 = !DILocation(line: 114, column: 17, scope: !162)
!177 = !DILocation(line: 115, column: 13, scope: !158)
!178 = !DILocation(line: 118, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !151, file: !12, line: 117, column: 13)
!180 = !DILocation(line: 122, column: 1, scope: !133)
