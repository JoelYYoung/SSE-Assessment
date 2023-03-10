; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_03.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 -5, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !22, metadata !DIExpression()), !dbg !29
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !29
  %1 = load i32, i32* %data, align 4, !dbg !30
  %cmp = icmp slt i32 %1, 10, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !34
  %idxprom = sext i32 %2 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !36
  %3 = load i32, i32* %arrayidx, align 4, !dbg !36
  call void @printIntLine(i32 %3), !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_03_good() #0 !dbg !42 {
entry:
  call void @goodB2G1(), !dbg !43
  call void @goodB2G2(), !dbg !44
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @CWE127_Buffer_Underread__CWE839_negative_03_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__CWE839_negative_03_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 -1, i32* %data, align 4, !dbg !71
  store i32 -5, i32* %data, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !75, metadata !DIExpression()), !dbg !79
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !79
  %1 = load i32, i32* %data, align 4, !dbg !80
  %cmp = icmp sge i32 %1, 0, !dbg !82
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !83

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !84
  %cmp1 = icmp slt i32 %2, 10, !dbg !85
  br i1 %cmp1, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !87
  %idxprom = sext i32 %3 to i64, !dbg !89
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !89
  %4 = load i32, i32* %arrayidx, align 4, !dbg !89
  call void @printIntLine(i32 %4), !dbg !90
  br label %if.end, !dbg !91

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !95 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 -1, i32* %data, align 4, !dbg !98
  store i32 -5, i32* %data, align 4, !dbg !99
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !102, metadata !DIExpression()), !dbg !106
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !106
  %1 = load i32, i32* %data, align 4, !dbg !107
  %cmp = icmp sge i32 %1, 0, !dbg !109
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !110

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !111
  %cmp1 = icmp slt i32 %2, 10, !dbg !112
  br i1 %cmp1, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !114
  %idxprom = sext i32 %3 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !116
  %4 = load i32, i32* %arrayidx, align 4, !dbg !116
  call void @printIntLine(i32 %4), !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !122 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i32 -1, i32* %data, align 4, !dbg !125
  store i32 7, i32* %data, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !129, metadata !DIExpression()), !dbg !133
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !133
  %1 = load i32, i32* %data, align 4, !dbg !134
  %cmp = icmp slt i32 %1, 10, !dbg !136
  br i1 %cmp, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !138
  %idxprom = sext i32 %2 to i64, !dbg !140
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !140
  %3 = load i32, i32* %arrayidx, align 4, !dbg !140
  call void @printIntLine(i32 %3), !dbg !141
  br label %if.end, !dbg !142

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !147, metadata !DIExpression()), !dbg !148
  store i32 -1, i32* %data, align 4, !dbg !149
  store i32 7, i32* %data, align 4, !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !153, metadata !DIExpression()), !dbg !157
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !157
  %1 = load i32, i32* %data, align 4, !dbg !158
  %cmp = icmp slt i32 %1, 10, !dbg !160
  br i1 %cmp, label %if.then, label %if.else, !dbg !161

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !162
  %idxprom = sext i32 %2 to i64, !dbg !164
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !164
  %3 = load i32, i32* %arrayidx, align 4, !dbg !164
  call void @printIntLine(i32 %3), !dbg !165
  br label %if.end, !dbg !166

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !167
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !169
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_03_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_03.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 30, column: 14, scope: !20)
!20 = distinct !DILexicalBlock(scope: !21, file: !12, line: 28, column: 5)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!22 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 35, type: !26)
!23 = distinct !DILexicalBlock(scope: !24, file: !12, line: 34, column: 9)
!24 = distinct !DILexicalBlock(scope: !25, file: !12, line: 33, column: 5)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 35, column: 17, scope: !23)
!30 = !DILocation(line: 38, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !12, line: 38, column: 17)
!32 = !DILocation(line: 38, column: 22, scope: !31)
!33 = !DILocation(line: 38, column: 17, scope: !23)
!34 = !DILocation(line: 40, column: 37, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 39, column: 13)
!36 = !DILocation(line: 40, column: 30, scope: !35)
!37 = !DILocation(line: 40, column: 17, scope: !35)
!38 = !DILocation(line: 41, column: 13, scope: !35)
!39 = !DILocation(line: 44, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !12, line: 43, column: 13)
!41 = !DILocation(line: 48, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_03_good", scope: !12, file: !12, line: 180, type: !13, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 182, column: 5, scope: !42)
!44 = !DILocation(line: 183, column: 5, scope: !42)
!45 = !DILocation(line: 184, column: 5, scope: !42)
!46 = !DILocation(line: 185, column: 5, scope: !42)
!47 = !DILocation(line: 186, column: 1, scope: !42)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 197, type: !49, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!16, !16, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 197, type: !16)
!55 = !DILocation(line: 197, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 197, type: !51)
!57 = !DILocation(line: 197, column: 27, scope: !48)
!58 = !DILocation(line: 200, column: 22, scope: !48)
!59 = !DILocation(line: 200, column: 12, scope: !48)
!60 = !DILocation(line: 200, column: 5, scope: !48)
!61 = !DILocation(line: 202, column: 5, scope: !48)
!62 = !DILocation(line: 203, column: 5, scope: !48)
!63 = !DILocation(line: 204, column: 5, scope: !48)
!64 = !DILocation(line: 207, column: 5, scope: !48)
!65 = !DILocation(line: 208, column: 5, scope: !48)
!66 = !DILocation(line: 209, column: 5, scope: !48)
!67 = !DILocation(line: 211, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 57, type: !16)
!70 = !DILocation(line: 57, column: 9, scope: !68)
!71 = !DILocation(line: 59, column: 10, scope: !68)
!72 = !DILocation(line: 63, column: 14, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !12, line: 61, column: 5)
!74 = distinct !DILexicalBlock(scope: !68, file: !12, line: 60, column: 8)
!75 = !DILocalVariable(name: "buffer", scope: !76, file: !12, line: 73, type: !26)
!76 = distinct !DILexicalBlock(scope: !77, file: !12, line: 72, column: 9)
!77 = distinct !DILexicalBlock(scope: !78, file: !12, line: 71, column: 5)
!78 = distinct !DILexicalBlock(scope: !68, file: !12, line: 65, column: 8)
!79 = !DILocation(line: 73, column: 17, scope: !76)
!80 = !DILocation(line: 75, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !12, line: 75, column: 17)
!82 = !DILocation(line: 75, column: 22, scope: !81)
!83 = !DILocation(line: 75, column: 27, scope: !81)
!84 = !DILocation(line: 75, column: 30, scope: !81)
!85 = !DILocation(line: 75, column: 35, scope: !81)
!86 = !DILocation(line: 75, column: 17, scope: !76)
!87 = !DILocation(line: 77, column: 37, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !12, line: 76, column: 13)
!89 = !DILocation(line: 77, column: 30, scope: !88)
!90 = !DILocation(line: 77, column: 17, scope: !88)
!91 = !DILocation(line: 78, column: 13, scope: !88)
!92 = !DILocation(line: 81, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !12, line: 80, column: 13)
!94 = !DILocation(line: 85, column: 1, scope: !68)
!95 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 90, type: !16)
!97 = !DILocation(line: 90, column: 9, scope: !95)
!98 = !DILocation(line: 92, column: 10, scope: !95)
!99 = !DILocation(line: 96, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !12, line: 94, column: 5)
!101 = distinct !DILexicalBlock(scope: !95, file: !12, line: 93, column: 8)
!102 = !DILocalVariable(name: "buffer", scope: !103, file: !12, line: 101, type: !26)
!103 = distinct !DILexicalBlock(scope: !104, file: !12, line: 100, column: 9)
!104 = distinct !DILexicalBlock(scope: !105, file: !12, line: 99, column: 5)
!105 = distinct !DILexicalBlock(scope: !95, file: !12, line: 98, column: 8)
!106 = !DILocation(line: 101, column: 17, scope: !103)
!107 = !DILocation(line: 103, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !12, line: 103, column: 17)
!109 = !DILocation(line: 103, column: 22, scope: !108)
!110 = !DILocation(line: 103, column: 27, scope: !108)
!111 = !DILocation(line: 103, column: 30, scope: !108)
!112 = !DILocation(line: 103, column: 35, scope: !108)
!113 = !DILocation(line: 103, column: 17, scope: !103)
!114 = !DILocation(line: 105, column: 37, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !12, line: 104, column: 13)
!116 = !DILocation(line: 105, column: 30, scope: !115)
!117 = !DILocation(line: 105, column: 17, scope: !115)
!118 = !DILocation(line: 106, column: 13, scope: !115)
!119 = !DILocation(line: 109, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !12, line: 108, column: 13)
!121 = !DILocation(line: 113, column: 1, scope: !95)
!122 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !12, line: 118, type: !16)
!124 = !DILocation(line: 118, column: 9, scope: !122)
!125 = !DILocation(line: 120, column: 10, scope: !122)
!126 = !DILocation(line: 130, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !12, line: 127, column: 5)
!128 = distinct !DILexicalBlock(scope: !122, file: !12, line: 121, column: 8)
!129 = !DILocalVariable(name: "buffer", scope: !130, file: !12, line: 135, type: !26)
!130 = distinct !DILexicalBlock(scope: !131, file: !12, line: 134, column: 9)
!131 = distinct !DILexicalBlock(scope: !132, file: !12, line: 133, column: 5)
!132 = distinct !DILexicalBlock(scope: !122, file: !12, line: 132, column: 8)
!133 = !DILocation(line: 135, column: 17, scope: !130)
!134 = !DILocation(line: 138, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !12, line: 138, column: 17)
!136 = !DILocation(line: 138, column: 22, scope: !135)
!137 = !DILocation(line: 138, column: 17, scope: !130)
!138 = !DILocation(line: 140, column: 37, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !12, line: 139, column: 13)
!140 = !DILocation(line: 140, column: 30, scope: !139)
!141 = !DILocation(line: 140, column: 17, scope: !139)
!142 = !DILocation(line: 141, column: 13, scope: !139)
!143 = !DILocation(line: 144, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !135, file: !12, line: 143, column: 13)
!145 = !DILocation(line: 148, column: 1, scope: !122)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 151, type: !13, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !12, line: 153, type: !16)
!148 = !DILocation(line: 153, column: 9, scope: !146)
!149 = !DILocation(line: 155, column: 10, scope: !146)
!150 = !DILocation(line: 160, column: 14, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !12, line: 157, column: 5)
!152 = distinct !DILexicalBlock(scope: !146, file: !12, line: 156, column: 8)
!153 = !DILocalVariable(name: "buffer", scope: !154, file: !12, line: 165, type: !26)
!154 = distinct !DILexicalBlock(scope: !155, file: !12, line: 164, column: 9)
!155 = distinct !DILexicalBlock(scope: !156, file: !12, line: 163, column: 5)
!156 = distinct !DILexicalBlock(scope: !146, file: !12, line: 162, column: 8)
!157 = !DILocation(line: 165, column: 17, scope: !154)
!158 = !DILocation(line: 168, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !12, line: 168, column: 17)
!160 = !DILocation(line: 168, column: 22, scope: !159)
!161 = !DILocation(line: 168, column: 17, scope: !154)
!162 = !DILocation(line: 170, column: 37, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 169, column: 13)
!164 = !DILocation(line: 170, column: 30, scope: !163)
!165 = !DILocation(line: 170, column: 17, scope: !163)
!166 = !DILocation(line: 171, column: 13, scope: !163)
!167 = !DILocation(line: 174, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !159, file: !12, line: 173, column: 13)
!169 = !DILocation(line: 178, column: 1, scope: !146)
