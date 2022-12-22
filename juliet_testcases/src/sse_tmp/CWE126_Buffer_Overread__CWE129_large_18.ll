; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %source, !dbg !19

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !20), !dbg !21
  store i32 10, i32* %data, align 4, !dbg !22
  br label %sink, !dbg !23

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !24), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !26, metadata !DIExpression()), !dbg !31
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !31
  %1 = load i32, i32* %data, align 4, !dbg !32
  %cmp = icmp sge i32 %1, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !36
  %idxprom = sext i32 %2 to i64, !dbg !38
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !38
  %3 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 %3), !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_18_good() #0 !dbg !44 {
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
  call void @CWE126_Buffer_Overread__CWE129_large_18_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__CWE129_large_18_bad(), !dbg !65
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
  br label %source, !dbg !72

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !73), !dbg !74
  store i32 10, i32* %data, align 4, !dbg !75
  br label %sink, !dbg !76

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !77), !dbg !78
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !79, metadata !DIExpression()), !dbg !81
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !81
  %1 = load i32, i32* %data, align 4, !dbg !82
  %cmp = icmp sge i32 %1, 0, !dbg !84
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !85

land.lhs.true:                                    ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !86
  %cmp1 = icmp slt i32 %2, 10, !dbg !87
  br i1 %cmp1, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !89
  %idxprom = sext i32 %3 to i64, !dbg !91
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !91
  %4 = load i32, i32* %arrayidx, align 4, !dbg !91
  call void @printIntLine(i32 %4), !dbg !92
  br label %if.end, !dbg !93

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  br label %source, !dbg !101

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !102), !dbg !103
  store i32 7, i32* %data, align 4, !dbg !104
  br label %sink, !dbg !105

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !106), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !108, metadata !DIExpression()), !dbg !110
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !110
  %1 = load i32, i32* %data, align 4, !dbg !111
  %cmp = icmp sge i32 %1, 0, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !115
  %idxprom = sext i32 %2 to i64, !dbg !117
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !117
  %3 = load i32, i32* %arrayidx, align 4, !dbg !117
  call void @printIntLine(i32 %3), !dbg !118
  br label %if.end, !dbg !119

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_18_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 5, scope: !11)
!20 = !DILabel(scope: !11, name: "source", file: !12, line: 28)
!21 = !DILocation(line: 28, column: 1, scope: !11)
!22 = !DILocation(line: 30, column: 10, scope: !11)
!23 = !DILocation(line: 31, column: 5, scope: !11)
!24 = !DILabel(scope: !11, name: "sink", file: !12, line: 32)
!25 = !DILocation(line: 32, column: 1, scope: !11)
!26 = !DILocalVariable(name: "buffer", scope: !27, file: !12, line: 34, type: !28)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 10)
!31 = !DILocation(line: 34, column: 13, scope: !27)
!32 = !DILocation(line: 37, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !12, line: 37, column: 13)
!34 = !DILocation(line: 37, column: 18, scope: !33)
!35 = !DILocation(line: 37, column: 13, scope: !27)
!36 = !DILocation(line: 39, column: 33, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 38, column: 9)
!38 = !DILocation(line: 39, column: 26, scope: !37)
!39 = !DILocation(line: 39, column: 13, scope: !37)
!40 = !DILocation(line: 40, column: 9, scope: !37)
!41 = !DILocation(line: 43, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !12, line: 42, column: 9)
!43 = !DILocation(line: 46, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_18_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 108, column: 5, scope: !44)
!46 = !DILocation(line: 109, column: 5, scope: !44)
!47 = !DILocation(line: 110, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !49, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!16, !16, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 121, type: !16)
!55 = !DILocation(line: 121, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 121, type: !51)
!57 = !DILocation(line: 121, column: 27, scope: !48)
!58 = !DILocation(line: 124, column: 22, scope: !48)
!59 = !DILocation(line: 124, column: 12, scope: !48)
!60 = !DILocation(line: 124, column: 5, scope: !48)
!61 = !DILocation(line: 126, column: 5, scope: !48)
!62 = !DILocation(line: 127, column: 5, scope: !48)
!63 = !DILocation(line: 128, column: 5, scope: !48)
!64 = !DILocation(line: 131, column: 5, scope: !48)
!65 = !DILocation(line: 132, column: 5, scope: !48)
!66 = !DILocation(line: 133, column: 5, scope: !48)
!67 = !DILocation(line: 135, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 55, type: !16)
!70 = !DILocation(line: 55, column: 9, scope: !68)
!71 = !DILocation(line: 57, column: 10, scope: !68)
!72 = !DILocation(line: 58, column: 5, scope: !68)
!73 = !DILabel(scope: !68, name: "source", file: !12, line: 59)
!74 = !DILocation(line: 59, column: 1, scope: !68)
!75 = !DILocation(line: 61, column: 10, scope: !68)
!76 = !DILocation(line: 62, column: 5, scope: !68)
!77 = !DILabel(scope: !68, name: "sink", file: !12, line: 63)
!78 = !DILocation(line: 63, column: 1, scope: !68)
!79 = !DILocalVariable(name: "buffer", scope: !80, file: !12, line: 65, type: !28)
!80 = distinct !DILexicalBlock(scope: !68, file: !12, line: 64, column: 5)
!81 = !DILocation(line: 65, column: 13, scope: !80)
!82 = !DILocation(line: 67, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 67, column: 13)
!84 = !DILocation(line: 67, column: 18, scope: !83)
!85 = !DILocation(line: 67, column: 23, scope: !83)
!86 = !DILocation(line: 67, column: 26, scope: !83)
!87 = !DILocation(line: 67, column: 31, scope: !83)
!88 = !DILocation(line: 67, column: 13, scope: !80)
!89 = !DILocation(line: 69, column: 33, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !12, line: 68, column: 9)
!91 = !DILocation(line: 69, column: 26, scope: !90)
!92 = !DILocation(line: 69, column: 13, scope: !90)
!93 = !DILocation(line: 70, column: 9, scope: !90)
!94 = !DILocation(line: 73, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 72, column: 9)
!96 = !DILocation(line: 76, column: 1, scope: !68)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 81, type: !16)
!99 = !DILocation(line: 81, column: 9, scope: !97)
!100 = !DILocation(line: 83, column: 10, scope: !97)
!101 = !DILocation(line: 84, column: 5, scope: !97)
!102 = !DILabel(scope: !97, name: "source", file: !12, line: 85)
!103 = !DILocation(line: 85, column: 1, scope: !97)
!104 = !DILocation(line: 88, column: 10, scope: !97)
!105 = !DILocation(line: 89, column: 5, scope: !97)
!106 = !DILabel(scope: !97, name: "sink", file: !12, line: 90)
!107 = !DILocation(line: 90, column: 1, scope: !97)
!108 = !DILocalVariable(name: "buffer", scope: !109, file: !12, line: 92, type: !28)
!109 = distinct !DILexicalBlock(scope: !97, file: !12, line: 91, column: 5)
!110 = !DILocation(line: 92, column: 13, scope: !109)
!111 = !DILocation(line: 95, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 95, column: 13)
!113 = !DILocation(line: 95, column: 18, scope: !112)
!114 = !DILocation(line: 95, column: 13, scope: !109)
!115 = !DILocation(line: 97, column: 33, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 96, column: 9)
!117 = !DILocation(line: 97, column: 26, scope: !116)
!118 = !DILocation(line: 97, column: 13, scope: !116)
!119 = !DILocation(line: 98, column: 9, scope: !116)
!120 = !DILocation(line: 101, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !12, line: 100, column: 9)
!122 = !DILocation(line: 104, column: 1, scope: !97)
