; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_01_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 @rand() #5, !dbg !19
  %and = and i32 %call, 1, !dbg !19
  %tobool = icmp ne i32 %and, 0, !dbg !19
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !19

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !19
  %shl = shl i32 %call1, 30, !dbg !19
  %call2 = call i32 @rand() #5, !dbg !19
  %shl3 = shl i32 %call2, 15, !dbg !19
  %xor = xor i32 %shl, %shl3, !dbg !19
  %call4 = call i32 @rand() #5, !dbg !19
  %xor5 = xor i32 %xor, %call4, !dbg !19
  br label %cond.end, !dbg !19

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !19
  %shl7 = shl i32 %call6, 30, !dbg !19
  %call8 = call i32 @rand() #5, !dbg !19
  %shl9 = shl i32 %call8, 15, !dbg !19
  %xor10 = xor i32 %shl7, %shl9, !dbg !19
  %call11 = call i32 @rand() #5, !dbg !19
  %xor12 = xor i32 %xor10, %call11, !dbg !19
  %sub = sub i32 0, %xor12, !dbg !19
  %sub13 = sub i32 %sub, 1, !dbg !19
  br label %cond.end, !dbg !19

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !19
  store i32 %cond, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !26
  %1 = load i32, i32* %data, align 4, !dbg !27
  %cmp = icmp slt i32 %1, 10, !dbg !29
  br i1 %cmp, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !31
  %idxprom = sext i32 %2 to i64, !dbg !33
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !33
  %3 = load i32, i32* %arrayidx, align 4, !dbg !33
  call void @printIntLine(i32 %3), !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_01_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  call void @goodB2G(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @CWE127_Buffer_Underread__CWE839_rand_01_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  call void @CWE127_Buffer_Underread__CWE839_rand_01_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 -1, i32* %data, align 4, !dbg !66
  store i32 7, i32* %data, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !68, metadata !DIExpression()), !dbg !70
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !70
  %1 = load i32, i32* %data, align 4, !dbg !71
  %cmp = icmp slt i32 %1, 10, !dbg !73
  br i1 %cmp, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !75
  %idxprom = sext i32 %2 to i64, !dbg !77
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !77
  %3 = load i32, i32* %arrayidx, align 4, !dbg !77
  call void @printIntLine(i32 %3), !dbg !78
  br label %if.end, !dbg !79

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 -1, i32* %data, align 4, !dbg !86
  %call = call i32 @rand() #5, !dbg !87
  %and = and i32 %call, 1, !dbg !87
  %tobool = icmp ne i32 %and, 0, !dbg !87
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !87

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !87
  %shl = shl i32 %call1, 30, !dbg !87
  %call2 = call i32 @rand() #5, !dbg !87
  %shl3 = shl i32 %call2, 15, !dbg !87
  %xor = xor i32 %shl, %shl3, !dbg !87
  %call4 = call i32 @rand() #5, !dbg !87
  %xor5 = xor i32 %xor, %call4, !dbg !87
  br label %cond.end, !dbg !87

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !87
  %shl7 = shl i32 %call6, 30, !dbg !87
  %call8 = call i32 @rand() #5, !dbg !87
  %shl9 = shl i32 %call8, 15, !dbg !87
  %xor10 = xor i32 %shl7, %shl9, !dbg !87
  %call11 = call i32 @rand() #5, !dbg !87
  %xor12 = xor i32 %xor10, %call11, !dbg !87
  %sub = sub i32 0, %xor12, !dbg !87
  %sub13 = sub i32 %sub, 1, !dbg !87
  br label %cond.end, !dbg !87

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !87
  store i32 %cond, i32* %data, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !89, metadata !DIExpression()), !dbg !91
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !91
  %1 = load i32, i32* %data, align 4, !dbg !92
  %cmp = icmp sge i32 %1, 0, !dbg !94
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !95

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !96
  %cmp14 = icmp slt i32 %2, 10, !dbg !97
  br i1 %cmp14, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !99
  %idxprom = sext i32 %3 to i64, !dbg !101
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !101
  %4 = load i32, i32* %arrayidx, align 4, !dbg !101
  call void @printIntLine(i32 %4), !dbg !102
  br label %if.end, !dbg !103

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !104
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_01_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_01.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 28, column: 12, scope: !12)
!20 = !DILocation(line: 28, column: 10, scope: !12)
!21 = !DILocalVariable(name: "buffer", scope: !22, file: !13, line: 30, type: !23)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 30, column: 13, scope: !22)
!27 = !DILocation(line: 33, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !13, line: 33, column: 13)
!29 = !DILocation(line: 33, column: 18, scope: !28)
!30 = !DILocation(line: 33, column: 13, scope: !22)
!31 = !DILocation(line: 35, column: 33, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !13, line: 34, column: 9)
!33 = !DILocation(line: 35, column: 26, scope: !32)
!34 = !DILocation(line: 35, column: 13, scope: !32)
!35 = !DILocation(line: 36, column: 9, scope: !32)
!36 = !DILocation(line: 39, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !13, line: 38, column: 9)
!38 = !DILocation(line: 42, column: 1, scope: !12)
!39 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_01_good", scope: !13, file: !13, line: 94, type: !14, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 96, column: 5, scope: !39)
!41 = !DILocation(line: 97, column: 5, scope: !39)
!42 = !DILocation(line: 98, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 109, type: !44, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!4, !4, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !13, line: 109, type: !4)
!50 = !DILocation(line: 109, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !13, line: 109, type: !46)
!52 = !DILocation(line: 109, column: 27, scope: !43)
!53 = !DILocation(line: 112, column: 22, scope: !43)
!54 = !DILocation(line: 112, column: 12, scope: !43)
!55 = !DILocation(line: 112, column: 5, scope: !43)
!56 = !DILocation(line: 114, column: 5, scope: !43)
!57 = !DILocation(line: 115, column: 5, scope: !43)
!58 = !DILocation(line: 116, column: 5, scope: !43)
!59 = !DILocation(line: 119, column: 5, scope: !43)
!60 = !DILocation(line: 120, column: 5, scope: !43)
!61 = !DILocation(line: 121, column: 5, scope: !43)
!62 = !DILocation(line: 123, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 49, type: !14, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !13, line: 51, type: !4)
!65 = !DILocation(line: 51, column: 9, scope: !63)
!66 = !DILocation(line: 53, column: 10, scope: !63)
!67 = !DILocation(line: 56, column: 10, scope: !63)
!68 = !DILocalVariable(name: "buffer", scope: !69, file: !13, line: 58, type: !23)
!69 = distinct !DILexicalBlock(scope: !63, file: !13, line: 57, column: 5)
!70 = !DILocation(line: 58, column: 13, scope: !69)
!71 = !DILocation(line: 61, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !13, line: 61, column: 13)
!73 = !DILocation(line: 61, column: 18, scope: !72)
!74 = !DILocation(line: 61, column: 13, scope: !69)
!75 = !DILocation(line: 63, column: 33, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !13, line: 62, column: 9)
!77 = !DILocation(line: 63, column: 26, scope: !76)
!78 = !DILocation(line: 63, column: 13, scope: !76)
!79 = !DILocation(line: 64, column: 9, scope: !76)
!80 = !DILocation(line: 67, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !13, line: 66, column: 9)
!82 = !DILocation(line: 70, column: 1, scope: !63)
!83 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 73, type: !14, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !13, line: 75, type: !4)
!85 = !DILocation(line: 75, column: 9, scope: !83)
!86 = !DILocation(line: 77, column: 10, scope: !83)
!87 = !DILocation(line: 79, column: 12, scope: !83)
!88 = !DILocation(line: 79, column: 10, scope: !83)
!89 = !DILocalVariable(name: "buffer", scope: !90, file: !13, line: 81, type: !23)
!90 = distinct !DILexicalBlock(scope: !83, file: !13, line: 80, column: 5)
!91 = !DILocation(line: 81, column: 13, scope: !90)
!92 = !DILocation(line: 83, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !13, line: 83, column: 13)
!94 = !DILocation(line: 83, column: 18, scope: !93)
!95 = !DILocation(line: 83, column: 23, scope: !93)
!96 = !DILocation(line: 83, column: 26, scope: !93)
!97 = !DILocation(line: 83, column: 31, scope: !93)
!98 = !DILocation(line: 83, column: 13, scope: !90)
!99 = !DILocation(line: 85, column: 33, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !13, line: 84, column: 9)
!101 = !DILocation(line: 85, column: 26, scope: !100)
!102 = !DILocation(line: 85, column: 13, scope: !100)
!103 = !DILocation(line: 86, column: 9, scope: !100)
!104 = !DILocation(line: 89, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !93, file: !13, line: 88, column: 9)
!106 = !DILocation(line: 92, column: 1, scope: !83)
