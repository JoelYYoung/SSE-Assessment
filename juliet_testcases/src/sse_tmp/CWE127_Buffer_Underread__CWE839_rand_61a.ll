; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* %data, align 4, !dbg !19
  %call = call i32 @CWE127_Buffer_Underread__CWE839_rand_61b_badSource(i32 %0), !dbg !20
  store i32 %call, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !22, metadata !DIExpression()), !dbg !27
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !27
  %2 = load i32, i32* %data, align 4, !dbg !28
  %cmp = icmp slt i32 %2, 10, !dbg !30
  br i1 %cmp, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !32
  %idxprom = sext i32 %3 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !34
  %4 = load i32, i32* %arrayidx, align 4, !dbg !34
  call void @printIntLine(i32 %4), !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @CWE127_Buffer_Underread__CWE839_rand_61b_badSource(i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_61_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  call void @goodB2G(), !dbg !42
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
  call void @CWE127_Buffer_Underread__CWE839_rand_61_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  call void @CWE127_Buffer_Underread__CWE839_rand_61_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, i32* %data, align 4, !dbg !67
  %0 = load i32, i32* %data, align 4, !dbg !68
  %call = call i32 @CWE127_Buffer_Underread__CWE839_rand_61b_goodG2BSource(i32 %0), !dbg !69
  store i32 %call, i32* %data, align 4, !dbg !70
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !71, metadata !DIExpression()), !dbg !73
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !73
  %2 = load i32, i32* %data, align 4, !dbg !74
  %cmp = icmp slt i32 %2, 10, !dbg !76
  br i1 %cmp, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !78
  %idxprom = sext i32 %3 to i64, !dbg !80
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !80
  %4 = load i32, i32* %arrayidx, align 4, !dbg !80
  call void @printIntLine(i32 %4), !dbg !81
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !83
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !85
}

declare dso_local i32 @CWE127_Buffer_Underread__CWE839_rand_61b_goodG2BSource(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !86 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 -1, i32* %data, align 4, !dbg !89
  %0 = load i32, i32* %data, align 4, !dbg !90
  %call = call i32 @CWE127_Buffer_Underread__CWE839_rand_61b_goodB2GSource(i32 %0), !dbg !91
  store i32 %call, i32* %data, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !93, metadata !DIExpression()), !dbg !95
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !95
  %2 = load i32, i32* %data, align 4, !dbg !96
  %cmp = icmp sge i32 %2, 0, !dbg !98
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !99

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !100
  %cmp1 = icmp slt i32 %3, 10, !dbg !101
  br i1 %cmp1, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !103
  %idxprom = sext i32 %4 to i64, !dbg !105
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !105
  %5 = load i32, i32* %arrayidx, align 4, !dbg !105
  call void @printIntLine(i32 %5), !dbg !106
  br label %if.end, !dbg !107

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !110
}

declare dso_local i32 @CWE127_Buffer_Underread__CWE839_rand_61b_goodB2GSource(i32) #2

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_61_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 27, column: 9, scope: !11)
!18 = !DILocation(line: 29, column: 10, scope: !11)
!19 = !DILocation(line: 30, column: 63, scope: !11)
!20 = !DILocation(line: 30, column: 12, scope: !11)
!21 = !DILocation(line: 30, column: 10, scope: !11)
!22 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 32, type: !24)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 32, column: 13, scope: !23)
!28 = !DILocation(line: 35, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !12, line: 35, column: 13)
!30 = !DILocation(line: 35, column: 18, scope: !29)
!31 = !DILocation(line: 35, column: 13, scope: !23)
!32 = !DILocation(line: 37, column: 33, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 36, column: 9)
!34 = !DILocation(line: 37, column: 26, scope: !33)
!35 = !DILocation(line: 37, column: 13, scope: !33)
!36 = !DILocation(line: 38, column: 9, scope: !33)
!37 = !DILocation(line: 41, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !12, line: 40, column: 9)
!39 = !DILocation(line: 44, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_61_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 99, column: 5, scope: !40)
!42 = !DILocation(line: 100, column: 5, scope: !40)
!43 = !DILocation(line: 101, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 112, type: !45, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!16, !16, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 112, type: !16)
!51 = !DILocation(line: 112, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 112, type: !47)
!53 = !DILocation(line: 112, column: 27, scope: !44)
!54 = !DILocation(line: 115, column: 22, scope: !44)
!55 = !DILocation(line: 115, column: 12, scope: !44)
!56 = !DILocation(line: 115, column: 5, scope: !44)
!57 = !DILocation(line: 117, column: 5, scope: !44)
!58 = !DILocation(line: 118, column: 5, scope: !44)
!59 = !DILocation(line: 119, column: 5, scope: !44)
!60 = !DILocation(line: 122, column: 5, scope: !44)
!61 = !DILocation(line: 123, column: 5, scope: !44)
!62 = !DILocation(line: 124, column: 5, scope: !44)
!63 = !DILocation(line: 126, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 55, type: !16)
!66 = !DILocation(line: 55, column: 9, scope: !64)
!67 = !DILocation(line: 57, column: 10, scope: !64)
!68 = !DILocation(line: 58, column: 67, scope: !64)
!69 = !DILocation(line: 58, column: 12, scope: !64)
!70 = !DILocation(line: 58, column: 10, scope: !64)
!71 = !DILocalVariable(name: "buffer", scope: !72, file: !12, line: 60, type: !24)
!72 = distinct !DILexicalBlock(scope: !64, file: !12, line: 59, column: 5)
!73 = !DILocation(line: 60, column: 13, scope: !72)
!74 = !DILocation(line: 63, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 63, column: 13)
!76 = !DILocation(line: 63, column: 18, scope: !75)
!77 = !DILocation(line: 63, column: 13, scope: !72)
!78 = !DILocation(line: 65, column: 33, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !12, line: 64, column: 9)
!80 = !DILocation(line: 65, column: 26, scope: !79)
!81 = !DILocation(line: 65, column: 13, scope: !79)
!82 = !DILocation(line: 66, column: 9, scope: !79)
!83 = !DILocation(line: 69, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !12, line: 68, column: 9)
!85 = !DILocation(line: 72, column: 1, scope: !64)
!86 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 79, type: !16)
!88 = !DILocation(line: 79, column: 9, scope: !86)
!89 = !DILocation(line: 81, column: 10, scope: !86)
!90 = !DILocation(line: 82, column: 67, scope: !86)
!91 = !DILocation(line: 82, column: 12, scope: !86)
!92 = !DILocation(line: 82, column: 10, scope: !86)
!93 = !DILocalVariable(name: "buffer", scope: !94, file: !12, line: 84, type: !24)
!94 = distinct !DILexicalBlock(scope: !86, file: !12, line: 83, column: 5)
!95 = !DILocation(line: 84, column: 13, scope: !94)
!96 = !DILocation(line: 86, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !12, line: 86, column: 13)
!98 = !DILocation(line: 86, column: 18, scope: !97)
!99 = !DILocation(line: 86, column: 23, scope: !97)
!100 = !DILocation(line: 86, column: 26, scope: !97)
!101 = !DILocation(line: 86, column: 31, scope: !97)
!102 = !DILocation(line: 86, column: 13, scope: !94)
!103 = !DILocation(line: 88, column: 33, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !12, line: 87, column: 9)
!105 = !DILocation(line: 88, column: 26, scope: !104)
!106 = !DILocation(line: 88, column: 13, scope: !104)
!107 = !DILocation(line: 89, column: 9, scope: !104)
!108 = !DILocation(line: 92, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !97, file: !12, line: 91, column: 9)
!110 = !DILocation(line: 95, column: 1, scope: !86)
