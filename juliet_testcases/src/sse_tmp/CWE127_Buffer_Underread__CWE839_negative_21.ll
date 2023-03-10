; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_21.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !12
@goodG2BStatic = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  store i32 -5, i32* %data, align 4, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i32, i32* %data, align 4, !dbg !30
  call void @badSink(i32 %0), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !33 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @badStatic, align 4, !dbg !38
  %tobool = icmp ne i32 %0, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end2, !dbg !40

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !41, metadata !DIExpression()), !dbg !47
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !47
  %2 = load i32, i32* %data.addr, align 4, !dbg !48
  %cmp = icmp slt i32 %2, 10, !dbg !50
  br i1 %cmp, label %if.then1, label %if.else, !dbg !51

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !52
  %idxprom = sext i32 %3 to i64, !dbg !54
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !54
  %4 = load i32, i32* %arrayidx, align 4, !dbg !54
  call void @printIntLine(i32 %4), !dbg !55
  br label %if.end, !dbg !56

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !57
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !59

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_21_good() #0 !dbg !61 {
entry:
  call void @goodB2G1(), !dbg !62
  call void @goodB2G2(), !dbg !63
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__CWE839_negative_21_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__CWE839_negative_21_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !86 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 -1, i32* %data, align 4, !dbg !89
  store i32 -5, i32* %data, align 4, !dbg !90
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !91
  %0 = load i32, i32* %data, align 4, !dbg !92
  call void @goodB2G1Sink(i32 %0), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !98
  %tobool = icmp ne i32 %0, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !101
  br label %if.end4, !dbg !103

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !104, metadata !DIExpression()), !dbg !107
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !107
  %2 = load i32, i32* %data.addr, align 4, !dbg !108
  %cmp = icmp sge i32 %2, 0, !dbg !110
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !111

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !112
  %cmp1 = icmp slt i32 %3, 10, !dbg !113
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !114

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !115
  %idxprom = sext i32 %4 to i64, !dbg !117
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !117
  %5 = load i32, i32* %arrayidx, align 4, !dbg !117
  call void @printIntLine(i32 %5), !dbg !118
  br label %if.end, !dbg !119

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  store i32 -5, i32* %data, align 4, !dbg !127
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !128
  %0 = load i32, i32* %data, align 4, !dbg !129
  call void @goodB2G2Sink(i32 %0), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !132 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !135
  %tobool = icmp ne i32 %0, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end3, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !138, metadata !DIExpression()), !dbg !141
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !141
  %2 = load i32, i32* %data.addr, align 4, !dbg !142
  %cmp = icmp sge i32 %2, 0, !dbg !144
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !145

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !146
  %cmp1 = icmp slt i32 %3, 10, !dbg !147
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !148

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !149
  %idxprom = sext i32 %4 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !151
  %5 = load i32, i32* %arrayidx, align 4, !dbg !151
  call void @printIntLine(i32 %5), !dbg !152
  br label %if.end, !dbg !153

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !154
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !156

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !158 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 -1, i32* %data, align 4, !dbg !161
  store i32 7, i32* %data, align 4, !dbg !162
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !163
  %0 = load i32, i32* %data, align 4, !dbg !164
  call void @goodG2BSink(i32 %0), !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !167 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !168, metadata !DIExpression()), !dbg !169
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !170
  %tobool = icmp ne i32 %0, 0, !dbg !170
  br i1 %tobool, label %if.then, label %if.end2, !dbg !172

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !173, metadata !DIExpression()), !dbg !176
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !176
  %2 = load i32, i32* %data.addr, align 4, !dbg !177
  %cmp = icmp slt i32 %2, 10, !dbg !179
  br i1 %cmp, label %if.then1, label %if.else, !dbg !180

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !181
  %idxprom = sext i32 %3 to i64, !dbg !183
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !183
  %4 = load i32, i32* %arrayidx, align 4, !dbg !183
  call void @printIntLine(i32 %4), !dbg !184
  br label %if.end, !dbg !185

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !186
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !188

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12, !14}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !10, line: 61, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !10, line: 62, type: !11, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !10, line: 63, type: !11, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_21_bad", scope: !10, file: !10, line: 45, type: !23, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !10, line: 47, type: !11)
!26 = !DILocation(line: 47, column: 9, scope: !22)
!27 = !DILocation(line: 49, column: 10, scope: !22)
!28 = !DILocation(line: 51, column: 10, scope: !22)
!29 = !DILocation(line: 52, column: 15, scope: !22)
!30 = !DILocation(line: 53, column: 13, scope: !22)
!31 = !DILocation(line: 53, column: 5, scope: !22)
!32 = !DILocation(line: 54, column: 1, scope: !22)
!33 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 25, type: !34, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !11}
!36 = !DILocalVariable(name: "data", arg: 1, scope: !33, file: !10, line: 25, type: !11)
!37 = !DILocation(line: 25, column: 25, scope: !33)
!38 = !DILocation(line: 27, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !10, line: 27, column: 8)
!40 = !DILocation(line: 27, column: 8, scope: !33)
!41 = !DILocalVariable(name: "buffer", scope: !42, file: !10, line: 30, type: !44)
!42 = distinct !DILexicalBlock(scope: !43, file: !10, line: 29, column: 9)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 28, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DILocation(line: 30, column: 17, scope: !42)
!48 = !DILocation(line: 33, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !10, line: 33, column: 17)
!50 = !DILocation(line: 33, column: 22, scope: !49)
!51 = !DILocation(line: 33, column: 17, scope: !42)
!52 = !DILocation(line: 35, column: 37, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 34, column: 13)
!54 = !DILocation(line: 35, column: 30, scope: !53)
!55 = !DILocation(line: 35, column: 17, scope: !53)
!56 = !DILocation(line: 36, column: 13, scope: !53)
!57 = !DILocation(line: 39, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !49, file: !10, line: 38, column: 13)
!59 = !DILocation(line: 42, column: 5, scope: !43)
!60 = !DILocation(line: 43, column: 1, scope: !33)
!61 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_21_good", scope: !10, file: !10, line: 165, type: !23, scopeLine: 166, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 167, column: 5, scope: !61)
!63 = !DILocation(line: 168, column: 5, scope: !61)
!64 = !DILocation(line: 169, column: 5, scope: !61)
!65 = !DILocation(line: 170, column: 1, scope: !61)
!66 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 181, type: !67, scopeLine: 182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!11, !11, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !10, line: 181, type: !11)
!73 = !DILocation(line: 181, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !10, line: 181, type: !69)
!75 = !DILocation(line: 181, column: 27, scope: !66)
!76 = !DILocation(line: 184, column: 22, scope: !66)
!77 = !DILocation(line: 184, column: 12, scope: !66)
!78 = !DILocation(line: 184, column: 5, scope: !66)
!79 = !DILocation(line: 186, column: 5, scope: !66)
!80 = !DILocation(line: 187, column: 5, scope: !66)
!81 = !DILocation(line: 188, column: 5, scope: !66)
!82 = !DILocation(line: 191, column: 5, scope: !66)
!83 = !DILocation(line: 192, column: 5, scope: !66)
!84 = !DILocation(line: 193, column: 5, scope: !66)
!85 = !DILocation(line: 195, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 90, type: !23, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !10, line: 92, type: !11)
!88 = !DILocation(line: 92, column: 9, scope: !86)
!89 = !DILocation(line: 94, column: 10, scope: !86)
!90 = !DILocation(line: 96, column: 10, scope: !86)
!91 = !DILocation(line: 97, column: 20, scope: !86)
!92 = !DILocation(line: 98, column: 18, scope: !86)
!93 = !DILocation(line: 98, column: 5, scope: !86)
!94 = !DILocation(line: 99, column: 1, scope: !86)
!95 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !10, file: !10, line: 66, type: !34, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !10, line: 66, type: !11)
!97 = !DILocation(line: 66, column: 30, scope: !95)
!98 = !DILocation(line: 68, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !10, line: 68, column: 8)
!100 = !DILocation(line: 68, column: 8, scope: !95)
!101 = !DILocation(line: 71, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !10, line: 69, column: 5)
!103 = !DILocation(line: 72, column: 5, scope: !102)
!104 = !DILocalVariable(name: "buffer", scope: !105, file: !10, line: 76, type: !44)
!105 = distinct !DILexicalBlock(scope: !106, file: !10, line: 75, column: 9)
!106 = distinct !DILexicalBlock(scope: !99, file: !10, line: 74, column: 5)
!107 = !DILocation(line: 76, column: 17, scope: !105)
!108 = !DILocation(line: 78, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !10, line: 78, column: 17)
!110 = !DILocation(line: 78, column: 22, scope: !109)
!111 = !DILocation(line: 78, column: 27, scope: !109)
!112 = !DILocation(line: 78, column: 30, scope: !109)
!113 = !DILocation(line: 78, column: 35, scope: !109)
!114 = !DILocation(line: 78, column: 17, scope: !105)
!115 = !DILocation(line: 80, column: 37, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !10, line: 79, column: 13)
!117 = !DILocation(line: 80, column: 30, scope: !116)
!118 = !DILocation(line: 80, column: 17, scope: !116)
!119 = !DILocation(line: 81, column: 13, scope: !116)
!120 = !DILocation(line: 84, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !10, line: 83, column: 13)
!122 = !DILocation(line: 88, column: 1, scope: !95)
!123 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 121, type: !23, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !10, line: 123, type: !11)
!125 = !DILocation(line: 123, column: 9, scope: !123)
!126 = !DILocation(line: 125, column: 10, scope: !123)
!127 = !DILocation(line: 127, column: 10, scope: !123)
!128 = !DILocation(line: 128, column: 20, scope: !123)
!129 = !DILocation(line: 129, column: 18, scope: !123)
!130 = !DILocation(line: 129, column: 5, scope: !123)
!131 = !DILocation(line: 130, column: 1, scope: !123)
!132 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !10, file: !10, line: 102, type: !34, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", arg: 1, scope: !132, file: !10, line: 102, type: !11)
!134 = !DILocation(line: 102, column: 30, scope: !132)
!135 = !DILocation(line: 104, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !10, line: 104, column: 8)
!137 = !DILocation(line: 104, column: 8, scope: !132)
!138 = !DILocalVariable(name: "buffer", scope: !139, file: !10, line: 107, type: !44)
!139 = distinct !DILexicalBlock(scope: !140, file: !10, line: 106, column: 9)
!140 = distinct !DILexicalBlock(scope: !136, file: !10, line: 105, column: 5)
!141 = !DILocation(line: 107, column: 17, scope: !139)
!142 = !DILocation(line: 109, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !10, line: 109, column: 17)
!144 = !DILocation(line: 109, column: 22, scope: !143)
!145 = !DILocation(line: 109, column: 27, scope: !143)
!146 = !DILocation(line: 109, column: 30, scope: !143)
!147 = !DILocation(line: 109, column: 35, scope: !143)
!148 = !DILocation(line: 109, column: 17, scope: !139)
!149 = !DILocation(line: 111, column: 37, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !10, line: 110, column: 13)
!151 = !DILocation(line: 111, column: 30, scope: !150)
!152 = !DILocation(line: 111, column: 17, scope: !150)
!153 = !DILocation(line: 112, column: 13, scope: !150)
!154 = !DILocation(line: 115, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !143, file: !10, line: 114, column: 13)
!156 = !DILocation(line: 118, column: 5, scope: !140)
!157 = !DILocation(line: 119, column: 1, scope: !132)
!158 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 153, type: !23, scopeLine: 154, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", scope: !158, file: !10, line: 155, type: !11)
!160 = !DILocation(line: 155, column: 9, scope: !158)
!161 = !DILocation(line: 157, column: 10, scope: !158)
!162 = !DILocation(line: 160, column: 10, scope: !158)
!163 = !DILocation(line: 161, column: 19, scope: !158)
!164 = !DILocation(line: 162, column: 17, scope: !158)
!165 = !DILocation(line: 162, column: 5, scope: !158)
!166 = !DILocation(line: 163, column: 1, scope: !158)
!167 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 133, type: !34, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!168 = !DILocalVariable(name: "data", arg: 1, scope: !167, file: !10, line: 133, type: !11)
!169 = !DILocation(line: 133, column: 29, scope: !167)
!170 = !DILocation(line: 135, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !10, line: 135, column: 8)
!172 = !DILocation(line: 135, column: 8, scope: !167)
!173 = !DILocalVariable(name: "buffer", scope: !174, file: !10, line: 138, type: !44)
!174 = distinct !DILexicalBlock(scope: !175, file: !10, line: 137, column: 9)
!175 = distinct !DILexicalBlock(scope: !171, file: !10, line: 136, column: 5)
!176 = !DILocation(line: 138, column: 17, scope: !174)
!177 = !DILocation(line: 141, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !10, line: 141, column: 17)
!179 = !DILocation(line: 141, column: 22, scope: !178)
!180 = !DILocation(line: 141, column: 17, scope: !174)
!181 = !DILocation(line: 143, column: 37, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !10, line: 142, column: 13)
!183 = !DILocation(line: 143, column: 30, scope: !182)
!184 = !DILocation(line: 143, column: 17, scope: !182)
!185 = !DILocation(line: 144, column: 13, scope: !182)
!186 = !DILocation(line: 147, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !178, file: !10, line: 146, column: 13)
!188 = !DILocation(line: 150, column: 5, scope: !175)
!189 = !DILocation(line: 151, column: 1, scope: !167)
