; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %while.body, !dbg !19

while.body:                                       ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !20
  br label %while.end, !dbg !22

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !23

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !24, metadata !DIExpression()), !dbg !30
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !30
  %1 = load i32, i32* %data, align 4, !dbg !31
  %cmp = icmp sge i32 %1, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !35
  %idxprom = sext i32 %2 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  %3 = load i32, i32* %arrayidx, align 4, !dbg !37
  call void @printIntLine(i32 %3), !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end2, !dbg !42

while.end2:                                       ; preds = %if.end
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_16_good() #0 !dbg !44 {
entry:
  call void @goodB2G(), !dbg !45
  call void @goodG2B(), !dbg !46
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
  call void @CWE126_Buffer_Overread__CWE129_large_16_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__CWE129_large_16_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 -1, i32* %data, align 4, !dbg !71
  br label %while.body, !dbg !72

while.body:                                       ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !73
  br label %while.end, !dbg !75

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !76

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !77, metadata !DIExpression()), !dbg !80
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !80
  %1 = load i32, i32* %data, align 4, !dbg !81
  %cmp = icmp sge i32 %1, 0, !dbg !83
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !84

land.lhs.true:                                    ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !85
  %cmp2 = icmp slt i32 %2, 10, !dbg !86
  br i1 %cmp2, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !88
  %idxprom = sext i32 %3 to i64, !dbg !90
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !90
  %4 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 %4), !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %land.lhs.true, %while.body1
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end3, !dbg !95

while.end3:                                       ; preds = %if.end
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  br label %while.body, !dbg !101

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !102
  br label %while.end, !dbg !104

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !105

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !106, metadata !DIExpression()), !dbg !109
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !109
  %1 = load i32, i32* %data, align 4, !dbg !110
  %cmp = icmp sge i32 %1, 0, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !114
  %idxprom = sext i32 %2 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !116
  %3 = load i32, i32* %arrayidx, align 4, !dbg !116
  call void @printIntLine(i32 %3), !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end2, !dbg !121

while.end2:                                       ; preds = %if.end
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 5, scope: !11)
!20 = !DILocation(line: 30, column: 14, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!22 = !DILocation(line: 31, column: 9, scope: !21)
!23 = !DILocation(line: 33, column: 5, scope: !11)
!24 = !DILocalVariable(name: "buffer", scope: !25, file: !12, line: 36, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !12, line: 35, column: 9)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 36, column: 17, scope: !25)
!31 = !DILocation(line: 39, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !12, line: 39, column: 17)
!33 = !DILocation(line: 39, column: 22, scope: !32)
!34 = !DILocation(line: 39, column: 17, scope: !25)
!35 = !DILocation(line: 41, column: 37, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 40, column: 13)
!37 = !DILocation(line: 41, column: 30, scope: !36)
!38 = !DILocation(line: 41, column: 17, scope: !36)
!39 = !DILocation(line: 42, column: 13, scope: !36)
!40 = !DILocation(line: 45, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !12, line: 44, column: 13)
!42 = !DILocation(line: 48, column: 9, scope: !26)
!43 = !DILocation(line: 50, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_16_good", scope: !12, file: !12, line: 118, type: !13, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 120, column: 5, scope: !44)
!46 = !DILocation(line: 121, column: 5, scope: !44)
!47 = !DILocation(line: 122, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !49, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!16, !16, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 133, type: !16)
!55 = !DILocation(line: 133, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 133, type: !51)
!57 = !DILocation(line: 133, column: 27, scope: !48)
!58 = !DILocation(line: 136, column: 22, scope: !48)
!59 = !DILocation(line: 136, column: 12, scope: !48)
!60 = !DILocation(line: 136, column: 5, scope: !48)
!61 = !DILocation(line: 138, column: 5, scope: !48)
!62 = !DILocation(line: 139, column: 5, scope: !48)
!63 = !DILocation(line: 140, column: 5, scope: !48)
!64 = !DILocation(line: 143, column: 5, scope: !48)
!65 = !DILocation(line: 144, column: 5, scope: !48)
!66 = !DILocation(line: 145, column: 5, scope: !48)
!67 = !DILocation(line: 147, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 59, type: !16)
!70 = !DILocation(line: 59, column: 9, scope: !68)
!71 = !DILocation(line: 61, column: 10, scope: !68)
!72 = !DILocation(line: 62, column: 5, scope: !68)
!73 = !DILocation(line: 65, column: 14, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !12, line: 63, column: 5)
!75 = !DILocation(line: 66, column: 9, scope: !74)
!76 = !DILocation(line: 68, column: 5, scope: !68)
!77 = !DILocalVariable(name: "buffer", scope: !78, file: !12, line: 71, type: !27)
!78 = distinct !DILexicalBlock(scope: !79, file: !12, line: 70, column: 9)
!79 = distinct !DILexicalBlock(scope: !68, file: !12, line: 69, column: 5)
!80 = !DILocation(line: 71, column: 17, scope: !78)
!81 = !DILocation(line: 73, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 73, column: 17)
!83 = !DILocation(line: 73, column: 22, scope: !82)
!84 = !DILocation(line: 73, column: 27, scope: !82)
!85 = !DILocation(line: 73, column: 30, scope: !82)
!86 = !DILocation(line: 73, column: 35, scope: !82)
!87 = !DILocation(line: 73, column: 17, scope: !78)
!88 = !DILocation(line: 75, column: 37, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !12, line: 74, column: 13)
!90 = !DILocation(line: 75, column: 30, scope: !89)
!91 = !DILocation(line: 75, column: 17, scope: !89)
!92 = !DILocation(line: 76, column: 13, scope: !89)
!93 = !DILocation(line: 79, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !12, line: 78, column: 13)
!95 = !DILocation(line: 82, column: 9, scope: !79)
!96 = !DILocation(line: 84, column: 1, scope: !68)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 89, type: !16)
!99 = !DILocation(line: 89, column: 9, scope: !97)
!100 = !DILocation(line: 91, column: 10, scope: !97)
!101 = !DILocation(line: 92, column: 5, scope: !97)
!102 = !DILocation(line: 96, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !12, line: 93, column: 5)
!104 = !DILocation(line: 97, column: 9, scope: !103)
!105 = !DILocation(line: 99, column: 5, scope: !97)
!106 = !DILocalVariable(name: "buffer", scope: !107, file: !12, line: 102, type: !27)
!107 = distinct !DILexicalBlock(scope: !108, file: !12, line: 101, column: 9)
!108 = distinct !DILexicalBlock(scope: !97, file: !12, line: 100, column: 5)
!109 = !DILocation(line: 102, column: 17, scope: !107)
!110 = !DILocation(line: 105, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 105, column: 17)
!112 = !DILocation(line: 105, column: 22, scope: !111)
!113 = !DILocation(line: 105, column: 17, scope: !107)
!114 = !DILocation(line: 107, column: 37, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 106, column: 13)
!116 = !DILocation(line: 107, column: 30, scope: !115)
!117 = !DILocation(line: 107, column: 17, scope: !115)
!118 = !DILocation(line: 108, column: 13, scope: !115)
!119 = !DILocation(line: 111, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !12, line: 110, column: 13)
!121 = !DILocation(line: 114, column: 9, scope: !108)
!122 = !DILocation(line: 116, column: 1, scope: !97)
