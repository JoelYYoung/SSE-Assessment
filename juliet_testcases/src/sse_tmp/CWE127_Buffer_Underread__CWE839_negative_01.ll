; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 -5, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !25
  %1 = load i32, i32* %data, align 4, !dbg !26
  %cmp = icmp slt i32 %1, 10, !dbg !28
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
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_01_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  call void @goodB2G(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #5, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #5, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @CWE127_Buffer_Underread__CWE839_negative_01_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  call void @CWE127_Buffer_Underread__CWE839_negative_01_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 -1, i32* %data, align 4, !dbg !65
  store i32 7, i32* %data, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !67, metadata !DIExpression()), !dbg !69
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !69
  %1 = load i32, i32* %data, align 4, !dbg !70
  %cmp = icmp slt i32 %1, 10, !dbg !72
  br i1 %cmp, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !74
  %idxprom = sext i32 %2 to i64, !dbg !76
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !76
  %3 = load i32, i32* %arrayidx, align 4, !dbg !76
  call void @printIntLine(i32 %3), !dbg !77
  br label %if.end, !dbg !78

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !79
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !82 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 -1, i32* %data, align 4, !dbg !85
  store i32 -5, i32* %data, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !87, metadata !DIExpression()), !dbg !89
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !89
  %1 = load i32, i32* %data, align 4, !dbg !90
  %cmp = icmp sge i32 %1, 0, !dbg !92
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !93

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !94
  %cmp1 = icmp slt i32 %2, 10, !dbg !95
  br i1 %cmp1, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !97
  %idxprom = sext i32 %3 to i64, !dbg !99
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !99
  %4 = load i32, i32* %arrayidx, align 4, !dbg !99
  call void @printIntLine(i32 %4), !dbg !100
  br label %if.end, !dbg !101

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 28, column: 10, scope: !11)
!20 = !DILocalVariable(name: "buffer", scope: !21, file: !12, line: 30, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 30, column: 13, scope: !21)
!26 = !DILocation(line: 33, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !12, line: 33, column: 13)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 13, scope: !21)
!30 = !DILocation(line: 35, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 34, column: 9)
!32 = !DILocation(line: 35, column: 26, scope: !31)
!33 = !DILocation(line: 35, column: 13, scope: !31)
!34 = !DILocation(line: 36, column: 9, scope: !31)
!35 = !DILocation(line: 39, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !12, line: 38, column: 9)
!37 = !DILocation(line: 42, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_01_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 96, column: 5, scope: !38)
!40 = !DILocation(line: 97, column: 5, scope: !38)
!41 = !DILocation(line: 98, column: 1, scope: !38)
!42 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !43, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!16, !16, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !12, line: 109, type: !16)
!49 = !DILocation(line: 109, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !12, line: 109, type: !45)
!51 = !DILocation(line: 109, column: 27, scope: !42)
!52 = !DILocation(line: 112, column: 22, scope: !42)
!53 = !DILocation(line: 112, column: 12, scope: !42)
!54 = !DILocation(line: 112, column: 5, scope: !42)
!55 = !DILocation(line: 114, column: 5, scope: !42)
!56 = !DILocation(line: 115, column: 5, scope: !42)
!57 = !DILocation(line: 116, column: 5, scope: !42)
!58 = !DILocation(line: 119, column: 5, scope: !42)
!59 = !DILocation(line: 120, column: 5, scope: !42)
!60 = !DILocation(line: 121, column: 5, scope: !42)
!61 = !DILocation(line: 123, column: 5, scope: !42)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !12, line: 51, type: !16)
!64 = !DILocation(line: 51, column: 9, scope: !62)
!65 = !DILocation(line: 53, column: 10, scope: !62)
!66 = !DILocation(line: 56, column: 10, scope: !62)
!67 = !DILocalVariable(name: "buffer", scope: !68, file: !12, line: 58, type: !22)
!68 = distinct !DILexicalBlock(scope: !62, file: !12, line: 57, column: 5)
!69 = !DILocation(line: 58, column: 13, scope: !68)
!70 = !DILocation(line: 61, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !12, line: 61, column: 13)
!72 = !DILocation(line: 61, column: 18, scope: !71)
!73 = !DILocation(line: 61, column: 13, scope: !68)
!74 = !DILocation(line: 63, column: 33, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !12, line: 62, column: 9)
!76 = !DILocation(line: 63, column: 26, scope: !75)
!77 = !DILocation(line: 63, column: 13, scope: !75)
!78 = !DILocation(line: 64, column: 9, scope: !75)
!79 = !DILocation(line: 67, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !12, line: 66, column: 9)
!81 = !DILocation(line: 70, column: 1, scope: !62)
!82 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 75, type: !16)
!84 = !DILocation(line: 75, column: 9, scope: !82)
!85 = !DILocation(line: 77, column: 10, scope: !82)
!86 = !DILocation(line: 79, column: 10, scope: !82)
!87 = !DILocalVariable(name: "buffer", scope: !88, file: !12, line: 81, type: !22)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 80, column: 5)
!89 = !DILocation(line: 81, column: 13, scope: !88)
!90 = !DILocation(line: 83, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 83, column: 13)
!92 = !DILocation(line: 83, column: 18, scope: !91)
!93 = !DILocation(line: 83, column: 23, scope: !91)
!94 = !DILocation(line: 83, column: 26, scope: !91)
!95 = !DILocation(line: 83, column: 31, scope: !91)
!96 = !DILocation(line: 83, column: 13, scope: !88)
!97 = !DILocation(line: 85, column: 33, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !12, line: 84, column: 9)
!99 = !DILocation(line: 85, column: 26, scope: !98)
!100 = !DILocation(line: 85, column: 13, scope: !98)
!101 = !DILocation(line: 86, column: 9, scope: !98)
!102 = !DILocation(line: 89, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !91, file: !12, line: 88, column: 9)
!104 = !DILocation(line: 92, column: 1, scope: !82)
