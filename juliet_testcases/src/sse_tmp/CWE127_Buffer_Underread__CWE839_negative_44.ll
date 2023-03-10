; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !18, metadata !DIExpression()), !dbg !22
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 -5, i32* %data, align 4, !dbg !24
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !25
  %1 = load i32, i32* %data, align 4, !dbg !26
  call void %0(i32 %1), !dbg !25
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !28 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !31, metadata !DIExpression()), !dbg !36
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !36
  %1 = load i32, i32* %data.addr, align 4, !dbg !37
  %cmp = icmp slt i32 %1, 10, !dbg !39
  br i1 %cmp, label %if.then, label %if.else, !dbg !40

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !41
  %idxprom = sext i32 %2 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !43
  %3 = load i32, i32* %arrayidx, align 4, !dbg !43
  call void @printIntLine(i32 %3), !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_44_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  call void @goodB2G(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__CWE839_negative_44_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__CWE839_negative_44_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
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
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !76, metadata !DIExpression()), !dbg !77
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  store i32 7, i32* %data, align 4, !dbg !79
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !80
  %1 = load i32, i32* %data, align 4, !dbg !81
  call void %0(i32 %1), !dbg !80
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !83 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !86, metadata !DIExpression()), !dbg !88
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !88
  %1 = load i32, i32* %data.addr, align 4, !dbg !89
  %cmp = icmp slt i32 %1, 10, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !93
  %idxprom = sext i32 %2 to i64, !dbg !95
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !95
  %3 = load i32, i32* %arrayidx, align 4, !dbg !95
  call void @printIntLine(i32 %3), !dbg !96
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !104, metadata !DIExpression()), !dbg !105
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !105
  store i32 -1, i32* %data, align 4, !dbg !106
  store i32 -5, i32* %data, align 4, !dbg !107
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !108
  %1 = load i32, i32* %data, align 4, !dbg !109
  call void %0(i32 %1), !dbg !108
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !114, metadata !DIExpression()), !dbg !116
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !116
  %1 = load i32, i32* %data.addr, align 4, !dbg !117
  %cmp = icmp sge i32 %1, 0, !dbg !119
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !120

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !121
  %cmp1 = icmp slt i32 %2, 10, !dbg !122
  br i1 %cmp1, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !124
  %idxprom = sext i32 %3 to i64, !dbg !126
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !126
  %4 = load i32, i32* %arrayidx, align 4, !dbg !126
  call void @printIntLine(i32 %4), !dbg !127
  br label %if.end, !dbg !128

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_44_bad", scope: !12, file: !12, line: 39, type: !13, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 41, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 41, column: 9, scope: !11)
!18 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 43, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !16}
!22 = !DILocation(line: 43, column: 12, scope: !11)
!23 = !DILocation(line: 45, column: 10, scope: !11)
!24 = !DILocation(line: 47, column: 10, scope: !11)
!25 = !DILocation(line: 49, column: 5, scope: !11)
!26 = !DILocation(line: 49, column: 13, scope: !11)
!27 = !DILocation(line: 50, column: 1, scope: !11)
!28 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 22, type: !20, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocalVariable(name: "data", arg: 1, scope: !28, file: !12, line: 22, type: !16)
!30 = !DILocation(line: 22, column: 25, scope: !28)
!31 = !DILocalVariable(name: "buffer", scope: !32, file: !12, line: 25, type: !33)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 24, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 25, column: 13, scope: !32)
!37 = !DILocation(line: 28, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !12, line: 28, column: 13)
!39 = !DILocation(line: 28, column: 18, scope: !38)
!40 = !DILocation(line: 28, column: 13, scope: !32)
!41 = !DILocation(line: 30, column: 33, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 29, column: 9)
!43 = !DILocation(line: 30, column: 26, scope: !42)
!44 = !DILocation(line: 30, column: 13, scope: !42)
!45 = !DILocation(line: 31, column: 9, scope: !42)
!46 = !DILocation(line: 34, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !12, line: 33, column: 9)
!48 = !DILocation(line: 37, column: 1, scope: !28)
!49 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_44_good", scope: !12, file: !12, line: 114, type: !13, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 116, column: 5, scope: !49)
!51 = !DILocation(line: 117, column: 5, scope: !49)
!52 = !DILocation(line: 118, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !54, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!16, !16, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 128, type: !16)
!60 = !DILocation(line: 128, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 128, type: !56)
!62 = !DILocation(line: 128, column: 27, scope: !53)
!63 = !DILocation(line: 131, column: 22, scope: !53)
!64 = !DILocation(line: 131, column: 12, scope: !53)
!65 = !DILocation(line: 131, column: 5, scope: !53)
!66 = !DILocation(line: 133, column: 5, scope: !53)
!67 = !DILocation(line: 134, column: 5, scope: !53)
!68 = !DILocation(line: 135, column: 5, scope: !53)
!69 = !DILocation(line: 138, column: 5, scope: !53)
!70 = !DILocation(line: 139, column: 5, scope: !53)
!71 = !DILocation(line: 140, column: 5, scope: !53)
!72 = !DILocation(line: 142, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 76, type: !16)
!75 = !DILocation(line: 76, column: 9, scope: !73)
!76 = !DILocalVariable(name: "funcPtr", scope: !73, file: !12, line: 77, type: !19)
!77 = !DILocation(line: 77, column: 12, scope: !73)
!78 = !DILocation(line: 79, column: 10, scope: !73)
!79 = !DILocation(line: 82, column: 10, scope: !73)
!80 = !DILocation(line: 83, column: 5, scope: !73)
!81 = !DILocation(line: 83, column: 13, scope: !73)
!82 = !DILocation(line: 84, column: 1, scope: !73)
!83 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 57, type: !20, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", arg: 1, scope: !83, file: !12, line: 57, type: !16)
!85 = !DILocation(line: 57, column: 29, scope: !83)
!86 = !DILocalVariable(name: "buffer", scope: !87, file: !12, line: 60, type: !33)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 59, column: 5)
!88 = !DILocation(line: 60, column: 13, scope: !87)
!89 = !DILocation(line: 63, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 63, column: 13)
!91 = !DILocation(line: 63, column: 18, scope: !90)
!92 = !DILocation(line: 63, column: 13, scope: !87)
!93 = !DILocation(line: 65, column: 33, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !12, line: 64, column: 9)
!95 = !DILocation(line: 65, column: 26, scope: !94)
!96 = !DILocation(line: 65, column: 13, scope: !94)
!97 = !DILocation(line: 66, column: 9, scope: !94)
!98 = !DILocation(line: 69, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !90, file: !12, line: 68, column: 9)
!100 = !DILocation(line: 72, column: 1, scope: !83)
!101 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 105, type: !16)
!103 = !DILocation(line: 105, column: 9, scope: !101)
!104 = !DILocalVariable(name: "funcPtr", scope: !101, file: !12, line: 106, type: !19)
!105 = !DILocation(line: 106, column: 12, scope: !101)
!106 = !DILocation(line: 108, column: 10, scope: !101)
!107 = !DILocation(line: 110, column: 10, scope: !101)
!108 = !DILocation(line: 111, column: 5, scope: !101)
!109 = !DILocation(line: 111, column: 13, scope: !101)
!110 = !DILocation(line: 112, column: 1, scope: !101)
!111 = distinct !DISubprogram(name: "goodB2GSink", scope: !12, file: !12, line: 87, type: !20, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !12, line: 87, type: !16)
!113 = !DILocation(line: 87, column: 29, scope: !111)
!114 = !DILocalVariable(name: "buffer", scope: !115, file: !12, line: 90, type: !33)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 89, column: 5)
!116 = !DILocation(line: 90, column: 13, scope: !115)
!117 = !DILocation(line: 92, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 92, column: 13)
!119 = !DILocation(line: 92, column: 18, scope: !118)
!120 = !DILocation(line: 92, column: 23, scope: !118)
!121 = !DILocation(line: 92, column: 26, scope: !118)
!122 = !DILocation(line: 92, column: 31, scope: !118)
!123 = !DILocation(line: 92, column: 13, scope: !115)
!124 = !DILocation(line: 94, column: 33, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !12, line: 93, column: 9)
!126 = !DILocation(line: 94, column: 26, scope: !125)
!127 = !DILocation(line: 94, column: 13, scope: !125)
!128 = !DILocation(line: 95, column: 9, scope: !125)
!129 = !DILocation(line: 98, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !118, file: !12, line: 97, column: 9)
!131 = !DILocation(line: 101, column: 1, scope: !111)
