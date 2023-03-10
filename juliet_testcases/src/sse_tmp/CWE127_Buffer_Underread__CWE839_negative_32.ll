; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !18, metadata !DIExpression()), !dbg !20
  store i32* %data, i32** %dataPtr1, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !21, metadata !DIExpression()), !dbg !22
  store i32* %data, i32** %dataPtr2, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !24, metadata !DIExpression()), !dbg !26
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !27
  %1 = load i32, i32* %0, align 4, !dbg !28
  store i32 %1, i32* %data1, align 4, !dbg !26
  store i32 -5, i32* %data1, align 4, !dbg !29
  %2 = load i32, i32* %data1, align 4, !dbg !30
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !31
  store i32 %2, i32* %3, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !33, metadata !DIExpression()), !dbg !35
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !36
  %5 = load i32, i32* %4, align 4, !dbg !37
  store i32 %5, i32* %data2, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !43
  %7 = load i32, i32* %data2, align 4, !dbg !44
  %cmp = icmp slt i32 %7, 10, !dbg !46
  br i1 %cmp, label %if.then, label %if.else, !dbg !47

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !48
  %idxprom = sext i32 %8 to i64, !dbg !50
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !50
  %9 = load i32, i32* %arrayidx, align 4, !dbg !50
  call void @printIntLine(i32 %9), !dbg !51
  br label %if.end, !dbg !52

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !53
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_32_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  call void @goodB2G(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @CWE127_Buffer_Underread__CWE839_negative_32_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__CWE839_negative_32_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* %data, i32** %dataPtr1, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* %data, i32** %dataPtr2, align 8, !dbg !86
  store i32 -1, i32* %data, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !88, metadata !DIExpression()), !dbg !90
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !91
  %1 = load i32, i32* %0, align 4, !dbg !92
  store i32 %1, i32* %data1, align 4, !dbg !90
  store i32 7, i32* %data1, align 4, !dbg !93
  %2 = load i32, i32* %data1, align 4, !dbg !94
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !95
  store i32 %2, i32* %3, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !97, metadata !DIExpression()), !dbg !99
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !100
  %5 = load i32, i32* %4, align 4, !dbg !101
  store i32 %5, i32* %data2, align 4, !dbg !99
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !102, metadata !DIExpression()), !dbg !104
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !104
  %7 = load i32, i32* %data2, align 4, !dbg !105
  %cmp = icmp slt i32 %7, 10, !dbg !107
  br i1 %cmp, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !109
  %idxprom = sext i32 %8 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !111
  %9 = load i32, i32* %arrayidx, align 4, !dbg !111
  call void @printIntLine(i32 %9), !dbg !112
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !117 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !120, metadata !DIExpression()), !dbg !121
  store i32* %data, i32** %dataPtr1, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !122, metadata !DIExpression()), !dbg !123
  store i32* %data, i32** %dataPtr2, align 8, !dbg !123
  store i32 -1, i32* %data, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !125, metadata !DIExpression()), !dbg !127
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !128
  %1 = load i32, i32* %0, align 4, !dbg !129
  store i32 %1, i32* %data1, align 4, !dbg !127
  store i32 -5, i32* %data1, align 4, !dbg !130
  %2 = load i32, i32* %data1, align 4, !dbg !131
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !132
  store i32 %2, i32* %3, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !134, metadata !DIExpression()), !dbg !136
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !137
  %5 = load i32, i32* %4, align 4, !dbg !138
  store i32 %5, i32* %data2, align 4, !dbg !136
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !139, metadata !DIExpression()), !dbg !141
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !141
  %7 = load i32, i32* %data2, align 4, !dbg !142
  %cmp = icmp sge i32 %7, 0, !dbg !144
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !145

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !146
  %cmp3 = icmp slt i32 %8, 10, !dbg !147
  br i1 %cmp3, label %if.then, label %if.else, !dbg !148

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* %data2, align 4, !dbg !149
  %idxprom = sext i32 %9 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !151
  %10 = load i32, i32* %arrayidx, align 4, !dbg !151
  call void @printIntLine(i32 %10), !dbg !152
  br label %if.end, !dbg !153

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !154
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !156
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_32_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 25, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!20 = !DILocation(line: 25, column: 10, scope: !11)
!21 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 26, type: !19)
!22 = !DILocation(line: 26, column: 10, scope: !11)
!23 = !DILocation(line: 28, column: 10, scope: !11)
!24 = !DILocalVariable(name: "data", scope: !25, file: !12, line: 30, type: !16)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 21, scope: !25)
!28 = !DILocation(line: 30, column: 20, scope: !25)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocation(line: 33, column: 21, scope: !25)
!31 = !DILocation(line: 33, column: 10, scope: !25)
!32 = !DILocation(line: 33, column: 19, scope: !25)
!33 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 36, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!35 = !DILocation(line: 36, column: 13, scope: !34)
!36 = !DILocation(line: 36, column: 21, scope: !34)
!37 = !DILocation(line: 36, column: 20, scope: !34)
!38 = !DILocalVariable(name: "buffer", scope: !39, file: !12, line: 38, type: !40)
!39 = distinct !DILexicalBlock(scope: !34, file: !12, line: 37, column: 9)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 10)
!43 = !DILocation(line: 38, column: 17, scope: !39)
!44 = !DILocation(line: 41, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !12, line: 41, column: 17)
!46 = !DILocation(line: 41, column: 22, scope: !45)
!47 = !DILocation(line: 41, column: 17, scope: !39)
!48 = !DILocation(line: 43, column: 37, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 42, column: 13)
!50 = !DILocation(line: 43, column: 30, scope: !49)
!51 = !DILocation(line: 43, column: 17, scope: !49)
!52 = !DILocation(line: 44, column: 13, scope: !49)
!53 = !DILocation(line: 47, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !45, file: !12, line: 46, column: 13)
!55 = !DILocation(line: 51, column: 1, scope: !11)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_32_good", scope: !12, file: !12, line: 121, type: !13, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 123, column: 5, scope: !56)
!58 = !DILocation(line: 124, column: 5, scope: !56)
!59 = !DILocation(line: 125, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !61, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!16, !16, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 135, type: !16)
!67 = !DILocation(line: 135, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 135, type: !63)
!69 = !DILocation(line: 135, column: 27, scope: !60)
!70 = !DILocation(line: 138, column: 22, scope: !60)
!71 = !DILocation(line: 138, column: 12, scope: !60)
!72 = !DILocation(line: 138, column: 5, scope: !60)
!73 = !DILocation(line: 140, column: 5, scope: !60)
!74 = !DILocation(line: 141, column: 5, scope: !60)
!75 = !DILocation(line: 142, column: 5, scope: !60)
!76 = !DILocation(line: 145, column: 5, scope: !60)
!77 = !DILocation(line: 146, column: 5, scope: !60)
!78 = !DILocation(line: 147, column: 5, scope: !60)
!79 = !DILocation(line: 149, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 60, type: !16)
!82 = !DILocation(line: 60, column: 9, scope: !80)
!83 = !DILocalVariable(name: "dataPtr1", scope: !80, file: !12, line: 61, type: !19)
!84 = !DILocation(line: 61, column: 10, scope: !80)
!85 = !DILocalVariable(name: "dataPtr2", scope: !80, file: !12, line: 62, type: !19)
!86 = !DILocation(line: 62, column: 10, scope: !80)
!87 = !DILocation(line: 64, column: 10, scope: !80)
!88 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 66, type: !16)
!89 = distinct !DILexicalBlock(scope: !80, file: !12, line: 65, column: 5)
!90 = !DILocation(line: 66, column: 13, scope: !89)
!91 = !DILocation(line: 66, column: 21, scope: !89)
!92 = !DILocation(line: 66, column: 20, scope: !89)
!93 = !DILocation(line: 69, column: 14, scope: !89)
!94 = !DILocation(line: 70, column: 21, scope: !89)
!95 = !DILocation(line: 70, column: 10, scope: !89)
!96 = !DILocation(line: 70, column: 19, scope: !89)
!97 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 73, type: !16)
!98 = distinct !DILexicalBlock(scope: !80, file: !12, line: 72, column: 5)
!99 = !DILocation(line: 73, column: 13, scope: !98)
!100 = !DILocation(line: 73, column: 21, scope: !98)
!101 = !DILocation(line: 73, column: 20, scope: !98)
!102 = !DILocalVariable(name: "buffer", scope: !103, file: !12, line: 75, type: !40)
!103 = distinct !DILexicalBlock(scope: !98, file: !12, line: 74, column: 9)
!104 = !DILocation(line: 75, column: 17, scope: !103)
!105 = !DILocation(line: 78, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 78, column: 17)
!107 = !DILocation(line: 78, column: 22, scope: !106)
!108 = !DILocation(line: 78, column: 17, scope: !103)
!109 = !DILocation(line: 80, column: 37, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !12, line: 79, column: 13)
!111 = !DILocation(line: 80, column: 30, scope: !110)
!112 = !DILocation(line: 80, column: 17, scope: !110)
!113 = !DILocation(line: 81, column: 13, scope: !110)
!114 = !DILocation(line: 84, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !12, line: 83, column: 13)
!116 = !DILocation(line: 88, column: 1, scope: !80)
!117 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 93, type: !16)
!119 = !DILocation(line: 93, column: 9, scope: !117)
!120 = !DILocalVariable(name: "dataPtr1", scope: !117, file: !12, line: 94, type: !19)
!121 = !DILocation(line: 94, column: 10, scope: !117)
!122 = !DILocalVariable(name: "dataPtr2", scope: !117, file: !12, line: 95, type: !19)
!123 = !DILocation(line: 95, column: 10, scope: !117)
!124 = !DILocation(line: 97, column: 10, scope: !117)
!125 = !DILocalVariable(name: "data", scope: !126, file: !12, line: 99, type: !16)
!126 = distinct !DILexicalBlock(scope: !117, file: !12, line: 98, column: 5)
!127 = !DILocation(line: 99, column: 13, scope: !126)
!128 = !DILocation(line: 99, column: 21, scope: !126)
!129 = !DILocation(line: 99, column: 20, scope: !126)
!130 = !DILocation(line: 101, column: 14, scope: !126)
!131 = !DILocation(line: 102, column: 21, scope: !126)
!132 = !DILocation(line: 102, column: 10, scope: !126)
!133 = !DILocation(line: 102, column: 19, scope: !126)
!134 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 105, type: !16)
!135 = distinct !DILexicalBlock(scope: !117, file: !12, line: 104, column: 5)
!136 = !DILocation(line: 105, column: 13, scope: !135)
!137 = !DILocation(line: 105, column: 21, scope: !135)
!138 = !DILocation(line: 105, column: 20, scope: !135)
!139 = !DILocalVariable(name: "buffer", scope: !140, file: !12, line: 107, type: !40)
!140 = distinct !DILexicalBlock(scope: !135, file: !12, line: 106, column: 9)
!141 = !DILocation(line: 107, column: 17, scope: !140)
!142 = !DILocation(line: 109, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 109, column: 17)
!144 = !DILocation(line: 109, column: 22, scope: !143)
!145 = !DILocation(line: 109, column: 27, scope: !143)
!146 = !DILocation(line: 109, column: 30, scope: !143)
!147 = !DILocation(line: 109, column: 35, scope: !143)
!148 = !DILocation(line: 109, column: 17, scope: !140)
!149 = !DILocation(line: 111, column: 37, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !12, line: 110, column: 13)
!151 = !DILocation(line: 111, column: 30, scope: !150)
!152 = !DILocation(line: 111, column: 17, scope: !150)
!153 = !DILocation(line: 112, column: 13, scope: !150)
!154 = !DILocation(line: 115, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !143, file: !12, line: 114, column: 13)
!156 = !DILocation(line: 119, column: 1, scope: !117)
