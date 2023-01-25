; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 10, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !25
  %1 = load i32, i32* %data, align 4, !dbg !26
  %cmp = icmp sge i32 %1, 0, !dbg !28
  br i1 %cmp, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !30
  %idxprom = sext i32 %2 to i64, !dbg !32
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !32
  %3 = load i32, i32* %arrayidx, align 4, !dbg !32
  call void @printIntLine(i32 %3), !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !35
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_15_good() #0 !dbg !38 {
entry:
  call void @goodB2G1(), !dbg !39
  call void @goodB2G2(), !dbg !40
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__CWE129_large_15_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__CWE129_large_15_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !64 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, i32* %data, align 4, !dbg !67
  store i32 10, i32* %data, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !69, metadata !DIExpression()), !dbg !71
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !71
  %1 = load i32, i32* %data, align 4, !dbg !72
  %cmp = icmp sge i32 %1, 0, !dbg !74
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !75

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !76
  %cmp1 = icmp slt i32 %2, 10, !dbg !77
  br i1 %cmp1, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !79
  %idxprom = sext i32 %3 to i64, !dbg !81
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !81
  %4 = load i32, i32* %arrayidx, align 4, !dbg !81
  call void @printIntLine(i32 %4), !dbg !82
  br label %if.end, !dbg !83

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !84
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %data, align 4, !dbg !90
  store i32 10, i32* %data, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !94
  %1 = load i32, i32* %data, align 4, !dbg !95
  %cmp = icmp sge i32 %1, 0, !dbg !97
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !98

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !99
  %cmp1 = icmp slt i32 %2, 10, !dbg !100
  br i1 %cmp1, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !102
  %idxprom = sext i32 %3 to i64, !dbg !104
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !104
  %4 = load i32, i32* %arrayidx, align 4, !dbg !104
  call void @printIntLine(i32 %4), !dbg !105
  br label %if.end, !dbg !106

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %data, align 4, !dbg !113
  store i32 7, i32* %data, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !115, metadata !DIExpression()), !dbg !117
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !117
  %1 = load i32, i32* %data, align 4, !dbg !118
  %cmp = icmp sge i32 %1, 0, !dbg !120
  br i1 %cmp, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !122
  %idxprom = sext i32 %2 to i64, !dbg !124
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !124
  %3 = load i32, i32* %arrayidx, align 4, !dbg !124
  call void @printIntLine(i32 %3), !dbg !125
  br label %if.end, !dbg !126

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 -1, i32* %data, align 4, !dbg !133
  store i32 7, i32* %data, align 4, !dbg !134
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !135, metadata !DIExpression()), !dbg !137
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !137
  %1 = load i32, i32* %data, align 4, !dbg !138
  %cmp = icmp sge i32 %1, 0, !dbg !140
  br i1 %cmp, label %if.then, label %if.else, !dbg !141

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %2 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %3 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 %3), !dbg !145
  br label %if.end, !dbg !146

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !147
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_15_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 31, column: 14, scope: !11)
!20 = !DILocalVariable(name: "buffer", scope: !21, file: !12, line: 42, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 42, column: 13, scope: !21)
!26 = !DILocation(line: 45, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !12, line: 45, column: 13)
!28 = !DILocation(line: 45, column: 18, scope: !27)
!29 = !DILocation(line: 45, column: 13, scope: !21)
!30 = !DILocation(line: 47, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 46, column: 9)
!32 = !DILocation(line: 47, column: 26, scope: !31)
!33 = !DILocation(line: 47, column: 13, scope: !31)
!34 = !DILocation(line: 48, column: 9, scope: !31)
!35 = !DILocation(line: 51, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !12, line: 50, column: 9)
!37 = !DILocation(line: 60, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_15_good", scope: !12, file: !12, line: 230, type: !13, scopeLine: 231, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 232, column: 5, scope: !38)
!40 = !DILocation(line: 233, column: 5, scope: !38)
!41 = !DILocation(line: 234, column: 5, scope: !38)
!42 = !DILocation(line: 235, column: 5, scope: !38)
!43 = !DILocation(line: 236, column: 1, scope: !38)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 247, type: !45, scopeLine: 248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!16, !16, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 247, type: !16)
!51 = !DILocation(line: 247, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 247, type: !47)
!53 = !DILocation(line: 247, column: 27, scope: !44)
!54 = !DILocation(line: 250, column: 22, scope: !44)
!55 = !DILocation(line: 250, column: 12, scope: !44)
!56 = !DILocation(line: 250, column: 5, scope: !44)
!57 = !DILocation(line: 252, column: 5, scope: !44)
!58 = !DILocation(line: 253, column: 5, scope: !44)
!59 = !DILocation(line: 254, column: 5, scope: !44)
!60 = !DILocation(line: 257, column: 5, scope: !44)
!61 = !DILocation(line: 258, column: 5, scope: !44)
!62 = !DILocation(line: 259, column: 5, scope: !44)
!63 = !DILocation(line: 261, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 69, type: !16)
!66 = !DILocation(line: 69, column: 9, scope: !64)
!67 = !DILocation(line: 71, column: 10, scope: !64)
!68 = !DILocation(line: 76, column: 14, scope: !64)
!69 = !DILocalVariable(name: "buffer", scope: !70, file: !12, line: 91, type: !22)
!70 = distinct !DILexicalBlock(scope: !64, file: !12, line: 90, column: 5)
!71 = !DILocation(line: 91, column: 13, scope: !70)
!72 = !DILocation(line: 93, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !12, line: 93, column: 13)
!74 = !DILocation(line: 93, column: 18, scope: !73)
!75 = !DILocation(line: 93, column: 23, scope: !73)
!76 = !DILocation(line: 93, column: 26, scope: !73)
!77 = !DILocation(line: 93, column: 31, scope: !73)
!78 = !DILocation(line: 93, column: 13, scope: !70)
!79 = !DILocation(line: 95, column: 33, scope: !80)
!80 = distinct !DILexicalBlock(scope: !73, file: !12, line: 94, column: 9)
!81 = !DILocation(line: 95, column: 26, scope: !80)
!82 = !DILocation(line: 95, column: 13, scope: !80)
!83 = !DILocation(line: 96, column: 9, scope: !80)
!84 = !DILocation(line: 99, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !73, file: !12, line: 98, column: 9)
!86 = !DILocation(line: 104, column: 1, scope: !64)
!87 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 107, type: !13, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 109, type: !16)
!89 = !DILocation(line: 109, column: 9, scope: !87)
!90 = !DILocation(line: 111, column: 10, scope: !87)
!91 = !DILocation(line: 116, column: 14, scope: !87)
!92 = !DILocalVariable(name: "buffer", scope: !93, file: !12, line: 127, type: !22)
!93 = distinct !DILexicalBlock(scope: !87, file: !12, line: 126, column: 5)
!94 = !DILocation(line: 127, column: 13, scope: !93)
!95 = !DILocation(line: 129, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 129, column: 13)
!97 = !DILocation(line: 129, column: 18, scope: !96)
!98 = !DILocation(line: 129, column: 23, scope: !96)
!99 = !DILocation(line: 129, column: 26, scope: !96)
!100 = !DILocation(line: 129, column: 31, scope: !96)
!101 = !DILocation(line: 129, column: 13, scope: !93)
!102 = !DILocation(line: 131, column: 33, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !12, line: 130, column: 9)
!104 = !DILocation(line: 131, column: 26, scope: !103)
!105 = !DILocation(line: 131, column: 13, scope: !103)
!106 = !DILocation(line: 132, column: 9, scope: !103)
!107 = !DILocation(line: 135, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !12, line: 134, column: 9)
!109 = !DILocation(line: 144, column: 1, scope: !87)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 147, type: !13, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 149, type: !16)
!112 = !DILocation(line: 149, column: 9, scope: !110)
!113 = !DILocation(line: 151, column: 10, scope: !110)
!114 = !DILocation(line: 161, column: 14, scope: !110)
!115 = !DILocalVariable(name: "buffer", scope: !116, file: !12, line: 168, type: !22)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 167, column: 5)
!117 = !DILocation(line: 168, column: 13, scope: !116)
!118 = !DILocation(line: 171, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 171, column: 13)
!120 = !DILocation(line: 171, column: 18, scope: !119)
!121 = !DILocation(line: 171, column: 13, scope: !116)
!122 = !DILocation(line: 173, column: 33, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 172, column: 9)
!124 = !DILocation(line: 173, column: 26, scope: !123)
!125 = !DILocation(line: 173, column: 13, scope: !123)
!126 = !DILocation(line: 174, column: 9, scope: !123)
!127 = !DILocation(line: 177, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !119, file: !12, line: 176, column: 9)
!129 = !DILocation(line: 186, column: 1, scope: !110)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 189, type: !13, scopeLine: 190, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !12, line: 191, type: !16)
!132 = !DILocation(line: 191, column: 9, scope: !130)
!133 = !DILocation(line: 193, column: 10, scope: !130)
!134 = !DILocation(line: 199, column: 14, scope: !130)
!135 = !DILocalVariable(name: "buffer", scope: !136, file: !12, line: 210, type: !22)
!136 = distinct !DILexicalBlock(scope: !130, file: !12, line: 209, column: 5)
!137 = !DILocation(line: 210, column: 13, scope: !136)
!138 = !DILocation(line: 213, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 213, column: 13)
!140 = !DILocation(line: 213, column: 18, scope: !139)
!141 = !DILocation(line: 213, column: 13, scope: !136)
!142 = !DILocation(line: 215, column: 33, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 214, column: 9)
!144 = !DILocation(line: 215, column: 26, scope: !143)
!145 = !DILocation(line: 215, column: 13, scope: !143)
!146 = !DILocation(line: 216, column: 9, scope: !143)
!147 = !DILocation(line: 219, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !139, file: !12, line: 218, column: 9)
!149 = !DILocation(line: 228, column: 1, scope: !130)
