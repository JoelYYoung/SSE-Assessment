; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_16_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %while.body, !dbg !19

while.body:                                       ; preds = %entry
  %call = call i32 @rand() #5, !dbg !20
  %and = and i32 %call, 1, !dbg !20
  %tobool = icmp ne i32 %and, 0, !dbg !20
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !20

cond.true:                                        ; preds = %while.body
  %call1 = call i32 @rand() #5, !dbg !20
  %shl = shl i32 %call1, 30, !dbg !20
  %call2 = call i32 @rand() #5, !dbg !20
  %shl3 = shl i32 %call2, 15, !dbg !20
  %xor = xor i32 %shl, %shl3, !dbg !20
  %call4 = call i32 @rand() #5, !dbg !20
  %xor5 = xor i32 %xor, %call4, !dbg !20
  br label %cond.end, !dbg !20

cond.false:                                       ; preds = %while.body
  %call6 = call i32 @rand() #5, !dbg !20
  %shl7 = shl i32 %call6, 30, !dbg !20
  %call8 = call i32 @rand() #5, !dbg !20
  %shl9 = shl i32 %call8, 15, !dbg !20
  %xor10 = xor i32 %shl7, %shl9, !dbg !20
  %call11 = call i32 @rand() #5, !dbg !20
  %xor12 = xor i32 %xor10, %call11, !dbg !20
  %sub = sub i32 0, %xor12, !dbg !20
  %sub13 = sub i32 %sub, 1, !dbg !20
  br label %cond.end, !dbg !20

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !20
  store i32 %cond, i32* %data, align 4, !dbg !22
  br label %while.end, !dbg !23

while.end:                                        ; preds = %cond.end
  br label %while.body14, !dbg !24

while.body14:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !25, metadata !DIExpression()), !dbg !31
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !31
  %1 = load i32, i32* %data, align 4, !dbg !32
  %cmp = icmp sge i32 %1, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %while.body14
  %2 = load i32, i32* %data, align 4, !dbg !36
  %idxprom = sext i32 %2 to i64, !dbg !38
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !38
  %3 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 %3), !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %while.body14
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end15, !dbg !43

while.end15:                                      ; preds = %if.end
  ret void, !dbg !44
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
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_16_good() #0 !dbg !45 {
entry:
  call void @goodB2G(), !dbg !46
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE129_rand_16_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE129_rand_16_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !69 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %data, align 4, !dbg !72
  br label %while.body, !dbg !73

while.body:                                       ; preds = %entry
  %call = call i32 @rand() #5, !dbg !74
  %and = and i32 %call, 1, !dbg !74
  %tobool = icmp ne i32 %and, 0, !dbg !74
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !74

cond.true:                                        ; preds = %while.body
  %call1 = call i32 @rand() #5, !dbg !74
  %shl = shl i32 %call1, 30, !dbg !74
  %call2 = call i32 @rand() #5, !dbg !74
  %shl3 = shl i32 %call2, 15, !dbg !74
  %xor = xor i32 %shl, %shl3, !dbg !74
  %call4 = call i32 @rand() #5, !dbg !74
  %xor5 = xor i32 %xor, %call4, !dbg !74
  br label %cond.end, !dbg !74

cond.false:                                       ; preds = %while.body
  %call6 = call i32 @rand() #5, !dbg !74
  %shl7 = shl i32 %call6, 30, !dbg !74
  %call8 = call i32 @rand() #5, !dbg !74
  %shl9 = shl i32 %call8, 15, !dbg !74
  %xor10 = xor i32 %shl7, %shl9, !dbg !74
  %call11 = call i32 @rand() #5, !dbg !74
  %xor12 = xor i32 %xor10, %call11, !dbg !74
  %sub = sub i32 0, %xor12, !dbg !74
  %sub13 = sub i32 %sub, 1, !dbg !74
  br label %cond.end, !dbg !74

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !74
  store i32 %cond, i32* %data, align 4, !dbg !76
  br label %while.end, !dbg !77

while.end:                                        ; preds = %cond.end
  br label %while.body14, !dbg !78

while.body14:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !79, metadata !DIExpression()), !dbg !82
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !82
  %1 = load i32, i32* %data, align 4, !dbg !83
  %cmp = icmp sge i32 %1, 0, !dbg !85
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !86

land.lhs.true:                                    ; preds = %while.body14
  %2 = load i32, i32* %data, align 4, !dbg !87
  %cmp15 = icmp slt i32 %2, 10, !dbg !88
  br i1 %cmp15, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !90
  %idxprom = sext i32 %3 to i64, !dbg !92
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !92
  %4 = load i32, i32* %arrayidx, align 4, !dbg !92
  call void @printIntLine(i32 %4), !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %land.lhs.true, %while.body14
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end16, !dbg !97

while.end16:                                      ; preds = %if.end
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %data, align 4, !dbg !102
  br label %while.body, !dbg !103

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !104
  br label %while.end, !dbg !106

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !107

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !108, metadata !DIExpression()), !dbg !111
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !111
  %1 = load i32, i32* %data, align 4, !dbg !112
  %cmp = icmp sge i32 %1, 0, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !116
  %idxprom = sext i32 %2 to i64, !dbg !118
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !118
  %3 = load i32, i32* %arrayidx, align 4, !dbg !118
  call void @printIntLine(i32 %3), !dbg !119
  br label %if.end, !dbg !120

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end2, !dbg !123

while.end2:                                       ; preds = %if.end
  ret void, !dbg !124
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_16.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_16_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_16.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 27, column: 5, scope: !12)
!20 = !DILocation(line: 30, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 28, column: 5)
!22 = !DILocation(line: 30, column: 14, scope: !21)
!23 = !DILocation(line: 31, column: 9, scope: !21)
!24 = !DILocation(line: 33, column: 5, scope: !12)
!25 = !DILocalVariable(name: "buffer", scope: !26, file: !13, line: 36, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !13, line: 35, column: 9)
!27 = distinct !DILexicalBlock(scope: !12, file: !13, line: 34, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 10)
!31 = !DILocation(line: 36, column: 17, scope: !26)
!32 = !DILocation(line: 39, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !13, line: 39, column: 17)
!34 = !DILocation(line: 39, column: 22, scope: !33)
!35 = !DILocation(line: 39, column: 17, scope: !26)
!36 = !DILocation(line: 41, column: 37, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !13, line: 40, column: 13)
!38 = !DILocation(line: 41, column: 30, scope: !37)
!39 = !DILocation(line: 41, column: 17, scope: !37)
!40 = !DILocation(line: 42, column: 13, scope: !37)
!41 = !DILocation(line: 45, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !13, line: 44, column: 13)
!43 = !DILocation(line: 48, column: 9, scope: !27)
!44 = !DILocation(line: 50, column: 1, scope: !12)
!45 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_16_good", scope: !13, file: !13, line: 118, type: !14, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 120, column: 5, scope: !45)
!47 = !DILocation(line: 121, column: 5, scope: !45)
!48 = !DILocation(line: 122, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 133, type: !50, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!4, !4, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !13, line: 133, type: !4)
!56 = !DILocation(line: 133, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !13, line: 133, type: !52)
!58 = !DILocation(line: 133, column: 27, scope: !49)
!59 = !DILocation(line: 136, column: 22, scope: !49)
!60 = !DILocation(line: 136, column: 12, scope: !49)
!61 = !DILocation(line: 136, column: 5, scope: !49)
!62 = !DILocation(line: 138, column: 5, scope: !49)
!63 = !DILocation(line: 139, column: 5, scope: !49)
!64 = !DILocation(line: 140, column: 5, scope: !49)
!65 = !DILocation(line: 143, column: 5, scope: !49)
!66 = !DILocation(line: 144, column: 5, scope: !49)
!67 = !DILocation(line: 145, column: 5, scope: !49)
!68 = !DILocation(line: 147, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 57, type: !14, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !13, line: 59, type: !4)
!71 = !DILocation(line: 59, column: 9, scope: !69)
!72 = !DILocation(line: 61, column: 10, scope: !69)
!73 = !DILocation(line: 62, column: 5, scope: !69)
!74 = !DILocation(line: 65, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !13, line: 63, column: 5)
!76 = !DILocation(line: 65, column: 14, scope: !75)
!77 = !DILocation(line: 66, column: 9, scope: !75)
!78 = !DILocation(line: 68, column: 5, scope: !69)
!79 = !DILocalVariable(name: "buffer", scope: !80, file: !13, line: 71, type: !28)
!80 = distinct !DILexicalBlock(scope: !81, file: !13, line: 70, column: 9)
!81 = distinct !DILexicalBlock(scope: !69, file: !13, line: 69, column: 5)
!82 = !DILocation(line: 71, column: 17, scope: !80)
!83 = !DILocation(line: 73, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !13, line: 73, column: 17)
!85 = !DILocation(line: 73, column: 22, scope: !84)
!86 = !DILocation(line: 73, column: 27, scope: !84)
!87 = !DILocation(line: 73, column: 30, scope: !84)
!88 = !DILocation(line: 73, column: 35, scope: !84)
!89 = !DILocation(line: 73, column: 17, scope: !80)
!90 = !DILocation(line: 75, column: 37, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !13, line: 74, column: 13)
!92 = !DILocation(line: 75, column: 30, scope: !91)
!93 = !DILocation(line: 75, column: 17, scope: !91)
!94 = !DILocation(line: 76, column: 13, scope: !91)
!95 = !DILocation(line: 79, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !13, line: 78, column: 13)
!97 = !DILocation(line: 82, column: 9, scope: !81)
!98 = !DILocation(line: 84, column: 1, scope: !69)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 87, type: !14, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !13, line: 89, type: !4)
!101 = !DILocation(line: 89, column: 9, scope: !99)
!102 = !DILocation(line: 91, column: 10, scope: !99)
!103 = !DILocation(line: 92, column: 5, scope: !99)
!104 = !DILocation(line: 96, column: 14, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !13, line: 93, column: 5)
!106 = !DILocation(line: 97, column: 9, scope: !105)
!107 = !DILocation(line: 99, column: 5, scope: !99)
!108 = !DILocalVariable(name: "buffer", scope: !109, file: !13, line: 102, type: !28)
!109 = distinct !DILexicalBlock(scope: !110, file: !13, line: 101, column: 9)
!110 = distinct !DILexicalBlock(scope: !99, file: !13, line: 100, column: 5)
!111 = !DILocation(line: 102, column: 17, scope: !109)
!112 = !DILocation(line: 105, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !13, line: 105, column: 17)
!114 = !DILocation(line: 105, column: 22, scope: !113)
!115 = !DILocation(line: 105, column: 17, scope: !109)
!116 = !DILocation(line: 107, column: 37, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !13, line: 106, column: 13)
!118 = !DILocation(line: 107, column: 30, scope: !117)
!119 = !DILocation(line: 107, column: 17, scope: !117)
!120 = !DILocation(line: 108, column: 13, scope: !117)
!121 = !DILocation(line: 111, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !113, file: !13, line: 110, column: 13)
!123 = !DILocation(line: 114, column: 9, scope: !110)
!124 = !DILocation(line: 116, column: 1, scope: !99)
