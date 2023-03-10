; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_12.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.else, !dbg !21

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !22
  br label %if.end, !dbg !24

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !25
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool2 = icmp ne i32 %call1, 0, !dbg !27
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !29

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !30, metadata !DIExpression()), !dbg !36
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !36
  %1 = load i32, i32* %data, align 4, !dbg !37
  %cmp = icmp slt i32 %1, 10, !dbg !39
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !40

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !41
  %idxprom = sext i32 %2 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !43
  %3 = load i32, i32* %arrayidx, align 4, !dbg !43
  call void @printIntLine(i32 %3), !dbg !44
  br label %if.end6, !dbg !45

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !46
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end16, !dbg !48

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !49, metadata !DIExpression()), !dbg !52
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !52
  %5 = load i32, i32* %data, align 4, !dbg !53
  %cmp9 = icmp sge i32 %5, 0, !dbg !55
  br i1 %cmp9, label %land.lhs.true, label %if.else14, !dbg !56

land.lhs.true:                                    ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !57
  %cmp10 = icmp slt i32 %6, 10, !dbg !58
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !59

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !60
  %idxprom12 = sext i32 %7 to i64, !dbg !62
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom12, !dbg !62
  %8 = load i32, i32* %arrayidx13, align 4, !dbg !62
  call void @printIntLine(i32 %8), !dbg !63
  br label %if.end15, !dbg !64

if.else14:                                        ; preds = %land.lhs.true, %if.else7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %if.then11
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.end6
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_12_good() #0 !dbg !68 {
entry:
  call void @goodB2G(), !dbg !69
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE127_Buffer_Underread__CWE839_negative_12_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  call void @CWE127_Buffer_Underread__CWE839_negative_12_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !92 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer9 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32 -1, i32* %data, align 4, !dbg !95
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !99
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !104
  %tobool2 = icmp ne i32 %call1, 0, !dbg !104
  br i1 %tobool2, label %if.then3, label %if.else8, !dbg !106

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !107, metadata !DIExpression()), !dbg !110
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !110
  %1 = load i32, i32* %data, align 4, !dbg !111
  %cmp = icmp sge i32 %1, 0, !dbg !113
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !114

land.lhs.true:                                    ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !115
  %cmp4 = icmp slt i32 %2, 10, !dbg !116
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !117

if.then5:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !118
  %idxprom = sext i32 %3 to i64, !dbg !120
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !120
  %4 = load i32, i32* %arrayidx, align 4, !dbg !120
  call void @printIntLine(i32 %4), !dbg !121
  br label %if.end7, !dbg !122

if.else6:                                         ; preds = %land.lhs.true, %if.then3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !123
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end18, !dbg !125

if.else8:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer9, metadata !126, metadata !DIExpression()), !dbg !129
  %5 = bitcast [10 x i32]* %buffer9 to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false), !dbg !129
  %6 = load i32, i32* %data, align 4, !dbg !130
  %cmp10 = icmp sge i32 %6, 0, !dbg !132
  br i1 %cmp10, label %land.lhs.true11, label %if.else16, !dbg !133

land.lhs.true11:                                  ; preds = %if.else8
  %7 = load i32, i32* %data, align 4, !dbg !134
  %cmp12 = icmp slt i32 %7, 10, !dbg !135
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !136

if.then13:                                        ; preds = %land.lhs.true11
  %8 = load i32, i32* %data, align 4, !dbg !137
  %idxprom14 = sext i32 %8 to i64, !dbg !139
  %arrayidx15 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer9, i64 0, i64 %idxprom14, !dbg !139
  %9 = load i32, i32* %arrayidx15, align 4, !dbg !139
  call void @printIntLine(i32 %9), !dbg !140
  br label %if.end17, !dbg !141

if.else16:                                        ; preds = %land.lhs.true11, %if.else8
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !142
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %if.then13
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end7
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !145 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i32 -1, i32* %data, align 4, !dbg !148
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !149
  %tobool = icmp ne i32 %call, 0, !dbg !149
  br i1 %tobool, label %if.then, label %if.else, !dbg !151

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !152
  br label %if.end, !dbg !154

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !155
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !157
  %tobool2 = icmp ne i32 %call1, 0, !dbg !157
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !159

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !160, metadata !DIExpression()), !dbg !163
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !163
  %1 = load i32, i32* %data, align 4, !dbg !164
  %cmp = icmp slt i32 %1, 10, !dbg !166
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !167

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !168
  %idxprom = sext i32 %2 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !170
  %3 = load i32, i32* %arrayidx, align 4, !dbg !170
  call void @printIntLine(i32 %3), !dbg !171
  br label %if.end6, !dbg !172

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !173
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !175

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !176, metadata !DIExpression()), !dbg !179
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !179
  %5 = load i32, i32* %data, align 4, !dbg !180
  %cmp9 = icmp slt i32 %5, 10, !dbg !182
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !183

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !184
  %idxprom11 = sext i32 %6 to i64, !dbg !186
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !186
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !186
  call void @printIntLine(i32 %7), !dbg !187
  br label %if.end14, !dbg !188

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !189
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !191
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !11)
!22 = !DILocation(line: 30, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!24 = !DILocation(line: 31, column: 5, scope: !23)
!25 = !DILocation(line: 36, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !20, file: !12, line: 33, column: 5)
!27 = !DILocation(line: 38, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 8)
!29 = !DILocation(line: 38, column: 8, scope: !11)
!30 = !DILocalVariable(name: "buffer", scope: !31, file: !12, line: 41, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 40, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 39, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 41, column: 17, scope: !31)
!37 = !DILocation(line: 44, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 44, column: 17)
!39 = !DILocation(line: 44, column: 22, scope: !38)
!40 = !DILocation(line: 44, column: 17, scope: !31)
!41 = !DILocation(line: 46, column: 37, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 45, column: 13)
!43 = !DILocation(line: 46, column: 30, scope: !42)
!44 = !DILocation(line: 46, column: 17, scope: !42)
!45 = !DILocation(line: 47, column: 13, scope: !42)
!46 = !DILocation(line: 50, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !12, line: 49, column: 13)
!48 = !DILocation(line: 53, column: 5, scope: !32)
!49 = !DILocalVariable(name: "buffer", scope: !50, file: !12, line: 57, type: !33)
!50 = distinct !DILexicalBlock(scope: !51, file: !12, line: 56, column: 9)
!51 = distinct !DILexicalBlock(scope: !28, file: !12, line: 55, column: 5)
!52 = !DILocation(line: 57, column: 17, scope: !50)
!53 = !DILocation(line: 59, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 59, column: 17)
!55 = !DILocation(line: 59, column: 22, scope: !54)
!56 = !DILocation(line: 59, column: 27, scope: !54)
!57 = !DILocation(line: 59, column: 30, scope: !54)
!58 = !DILocation(line: 59, column: 35, scope: !54)
!59 = !DILocation(line: 59, column: 17, scope: !50)
!60 = !DILocation(line: 61, column: 37, scope: !61)
!61 = distinct !DILexicalBlock(scope: !54, file: !12, line: 60, column: 13)
!62 = !DILocation(line: 61, column: 30, scope: !61)
!63 = !DILocation(line: 61, column: 17, scope: !61)
!64 = !DILocation(line: 62, column: 13, scope: !61)
!65 = !DILocation(line: 65, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !54, file: !12, line: 64, column: 13)
!67 = !DILocation(line: 69, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_12_good", scope: !12, file: !12, line: 179, type: !13, scopeLine: 180, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 181, column: 5, scope: !68)
!70 = !DILocation(line: 182, column: 5, scope: !68)
!71 = !DILocation(line: 183, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 194, type: !73, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!16, !16, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 194, type: !16)
!79 = !DILocation(line: 194, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 194, type: !75)
!81 = !DILocation(line: 194, column: 27, scope: !72)
!82 = !DILocation(line: 197, column: 22, scope: !72)
!83 = !DILocation(line: 197, column: 12, scope: !72)
!84 = !DILocation(line: 197, column: 5, scope: !72)
!85 = !DILocation(line: 199, column: 5, scope: !72)
!86 = !DILocation(line: 200, column: 5, scope: !72)
!87 = !DILocation(line: 201, column: 5, scope: !72)
!88 = !DILocation(line: 204, column: 5, scope: !72)
!89 = !DILocation(line: 205, column: 5, scope: !72)
!90 = !DILocation(line: 206, column: 5, scope: !72)
!91 = !DILocation(line: 208, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 80, type: !16)
!94 = !DILocation(line: 80, column: 9, scope: !92)
!95 = !DILocation(line: 82, column: 10, scope: !92)
!96 = !DILocation(line: 83, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !12, line: 83, column: 8)
!98 = !DILocation(line: 83, column: 8, scope: !92)
!99 = !DILocation(line: 86, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !12, line: 84, column: 5)
!101 = !DILocation(line: 87, column: 5, scope: !100)
!102 = !DILocation(line: 91, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !12, line: 89, column: 5)
!104 = !DILocation(line: 93, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !92, file: !12, line: 93, column: 8)
!106 = !DILocation(line: 93, column: 8, scope: !92)
!107 = !DILocalVariable(name: "buffer", scope: !108, file: !12, line: 96, type: !33)
!108 = distinct !DILexicalBlock(scope: !109, file: !12, line: 95, column: 9)
!109 = distinct !DILexicalBlock(scope: !105, file: !12, line: 94, column: 5)
!110 = !DILocation(line: 96, column: 17, scope: !108)
!111 = !DILocation(line: 98, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !12, line: 98, column: 17)
!113 = !DILocation(line: 98, column: 22, scope: !112)
!114 = !DILocation(line: 98, column: 27, scope: !112)
!115 = !DILocation(line: 98, column: 30, scope: !112)
!116 = !DILocation(line: 98, column: 35, scope: !112)
!117 = !DILocation(line: 98, column: 17, scope: !108)
!118 = !DILocation(line: 100, column: 37, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !12, line: 99, column: 13)
!120 = !DILocation(line: 100, column: 30, scope: !119)
!121 = !DILocation(line: 100, column: 17, scope: !119)
!122 = !DILocation(line: 101, column: 13, scope: !119)
!123 = !DILocation(line: 104, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !12, line: 103, column: 13)
!125 = !DILocation(line: 107, column: 5, scope: !109)
!126 = !DILocalVariable(name: "buffer", scope: !127, file: !12, line: 111, type: !33)
!127 = distinct !DILexicalBlock(scope: !128, file: !12, line: 110, column: 9)
!128 = distinct !DILexicalBlock(scope: !105, file: !12, line: 109, column: 5)
!129 = !DILocation(line: 111, column: 17, scope: !127)
!130 = !DILocation(line: 113, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 113, column: 17)
!132 = !DILocation(line: 113, column: 22, scope: !131)
!133 = !DILocation(line: 113, column: 27, scope: !131)
!134 = !DILocation(line: 113, column: 30, scope: !131)
!135 = !DILocation(line: 113, column: 35, scope: !131)
!136 = !DILocation(line: 113, column: 17, scope: !127)
!137 = !DILocation(line: 115, column: 37, scope: !138)
!138 = distinct !DILexicalBlock(scope: !131, file: !12, line: 114, column: 13)
!139 = !DILocation(line: 115, column: 30, scope: !138)
!140 = !DILocation(line: 115, column: 17, scope: !138)
!141 = !DILocation(line: 116, column: 13, scope: !138)
!142 = !DILocation(line: 119, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !131, file: !12, line: 118, column: 13)
!144 = !DILocation(line: 123, column: 1, scope: !92)
!145 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 128, type: !13, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 130, type: !16)
!147 = !DILocation(line: 130, column: 9, scope: !145)
!148 = !DILocation(line: 132, column: 10, scope: !145)
!149 = !DILocation(line: 133, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 133, column: 8)
!151 = !DILocation(line: 133, column: 8, scope: !145)
!152 = !DILocation(line: 137, column: 14, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 134, column: 5)
!154 = !DILocation(line: 138, column: 5, scope: !153)
!155 = !DILocation(line: 143, column: 14, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !12, line: 140, column: 5)
!157 = !DILocation(line: 145, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !12, line: 145, column: 8)
!159 = !DILocation(line: 145, column: 8, scope: !145)
!160 = !DILocalVariable(name: "buffer", scope: !161, file: !12, line: 148, type: !33)
!161 = distinct !DILexicalBlock(scope: !162, file: !12, line: 147, column: 9)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 146, column: 5)
!163 = !DILocation(line: 148, column: 17, scope: !161)
!164 = !DILocation(line: 151, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 151, column: 17)
!166 = !DILocation(line: 151, column: 22, scope: !165)
!167 = !DILocation(line: 151, column: 17, scope: !161)
!168 = !DILocation(line: 153, column: 37, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 152, column: 13)
!170 = !DILocation(line: 153, column: 30, scope: !169)
!171 = !DILocation(line: 153, column: 17, scope: !169)
!172 = !DILocation(line: 154, column: 13, scope: !169)
!173 = !DILocation(line: 157, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !165, file: !12, line: 156, column: 13)
!175 = !DILocation(line: 160, column: 5, scope: !162)
!176 = !DILocalVariable(name: "buffer", scope: !177, file: !12, line: 164, type: !33)
!177 = distinct !DILexicalBlock(scope: !178, file: !12, line: 163, column: 9)
!178 = distinct !DILexicalBlock(scope: !158, file: !12, line: 162, column: 5)
!179 = !DILocation(line: 164, column: 17, scope: !177)
!180 = !DILocation(line: 167, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !12, line: 167, column: 17)
!182 = !DILocation(line: 167, column: 22, scope: !181)
!183 = !DILocation(line: 167, column: 17, scope: !177)
!184 = !DILocation(line: 169, column: 37, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !12, line: 168, column: 13)
!186 = !DILocation(line: 169, column: 30, scope: !185)
!187 = !DILocation(line: 169, column: 17, scope: !185)
!188 = !DILocation(line: 170, column: 13, scope: !185)
!189 = !DILocation(line: 173, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !12, line: 172, column: 13)
!191 = !DILocation(line: 177, column: 1, scope: !145)
