; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_44_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !18, metadata !DIExpression()), !dbg !22
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %call = call i32 @rand() #5, !dbg !24
  %and = and i32 %call, 1, !dbg !24
  %tobool = icmp ne i32 %and, 0, !dbg !24
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !24
  %shl = shl i32 %call1, 30, !dbg !24
  %call2 = call i32 @rand() #5, !dbg !24
  %shl3 = shl i32 %call2, 15, !dbg !24
  %xor = xor i32 %shl, %shl3, !dbg !24
  %call4 = call i32 @rand() #5, !dbg !24
  %xor5 = xor i32 %xor, %call4, !dbg !24
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !24
  %shl7 = shl i32 %call6, 30, !dbg !24
  %call8 = call i32 @rand() #5, !dbg !24
  %shl9 = shl i32 %call8, 15, !dbg !24
  %xor10 = xor i32 %shl7, %shl9, !dbg !24
  %call11 = call i32 @rand() #5, !dbg !24
  %xor12 = xor i32 %xor10, %call11, !dbg !24
  %sub = sub i32 0, %xor12, !dbg !24
  %sub13 = sub i32 %sub, 1, !dbg !24
  br label %cond.end, !dbg !24

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !24
  store i32 %cond, i32* %data, align 4, !dbg !25
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !26
  %1 = load i32, i32* %data, align 4, !dbg !27
  call void %0(i32 %1), !dbg !26
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !29 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !37
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !37
  %1 = load i32, i32* %data.addr, align 4, !dbg !38
  %cmp = icmp slt i32 %1, 10, !dbg !40
  br i1 %cmp, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !42
  %idxprom = sext i32 %2 to i64, !dbg !44
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !44
  %3 = load i32, i32* %arrayidx, align 4, !dbg !44
  call void @printIntLine(i32 %3), !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !49
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_44_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  call void @goodB2G(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__CWE839_rand_44_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__CWE839_rand_44_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
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
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !77, metadata !DIExpression()), !dbg !78
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  store i32 7, i32* %data, align 4, !dbg !80
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !81
  %1 = load i32, i32* %data, align 4, !dbg !82
  call void %0(i32 %1), !dbg !81
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !87, metadata !DIExpression()), !dbg !89
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !89
  %1 = load i32, i32* %data.addr, align 4, !dbg !90
  %cmp = icmp slt i32 %1, 10, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !94
  %idxprom = sext i32 %2 to i64, !dbg !96
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !96
  %3 = load i32, i32* %arrayidx, align 4, !dbg !96
  call void @printIntLine(i32 %3), !dbg !97
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !102 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !106
  store i32 -1, i32* %data, align 4, !dbg !107
  %call = call i32 @rand() #5, !dbg !108
  %and = and i32 %call, 1, !dbg !108
  %tobool = icmp ne i32 %and, 0, !dbg !108
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !108

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !108
  %shl = shl i32 %call1, 30, !dbg !108
  %call2 = call i32 @rand() #5, !dbg !108
  %shl3 = shl i32 %call2, 15, !dbg !108
  %xor = xor i32 %shl, %shl3, !dbg !108
  %call4 = call i32 @rand() #5, !dbg !108
  %xor5 = xor i32 %xor, %call4, !dbg !108
  br label %cond.end, !dbg !108

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !108
  %shl7 = shl i32 %call6, 30, !dbg !108
  %call8 = call i32 @rand() #5, !dbg !108
  %shl9 = shl i32 %call8, 15, !dbg !108
  %xor10 = xor i32 %shl7, %shl9, !dbg !108
  %call11 = call i32 @rand() #5, !dbg !108
  %xor12 = xor i32 %xor10, %call11, !dbg !108
  %sub = sub i32 0, %xor12, !dbg !108
  %sub13 = sub i32 %sub, 1, !dbg !108
  br label %cond.end, !dbg !108

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !108
  store i32 %cond, i32* %data, align 4, !dbg !109
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !110
  %1 = load i32, i32* %data, align 4, !dbg !111
  call void %0(i32 %1), !dbg !110
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !113 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !116, metadata !DIExpression()), !dbg !118
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !118
  %1 = load i32, i32* %data.addr, align 4, !dbg !119
  %cmp = icmp sge i32 %1, 0, !dbg !121
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !122

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !123
  %cmp1 = icmp slt i32 %2, 10, !dbg !124
  br i1 %cmp1, label %if.then, label %if.else, !dbg !125

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !126
  %idxprom = sext i32 %3 to i64, !dbg !128
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !128
  %4 = load i32, i32* %arrayidx, align 4, !dbg !128
  call void @printIntLine(i32 %4), !dbg !129
  br label %if.end, !dbg !130

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_44_bad", scope: !13, file: !13, line: 39, type: !14, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_44.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 41, type: !4)
!17 = !DILocation(line: 41, column: 9, scope: !12)
!18 = !DILocalVariable(name: "funcPtr", scope: !12, file: !13, line: 43, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !4}
!22 = !DILocation(line: 43, column: 12, scope: !12)
!23 = !DILocation(line: 45, column: 10, scope: !12)
!24 = !DILocation(line: 47, column: 12, scope: !12)
!25 = !DILocation(line: 47, column: 10, scope: !12)
!26 = !DILocation(line: 49, column: 5, scope: !12)
!27 = !DILocation(line: 49, column: 13, scope: !12)
!28 = !DILocation(line: 50, column: 1, scope: !12)
!29 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 22, type: !20, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocalVariable(name: "data", arg: 1, scope: !29, file: !13, line: 22, type: !4)
!31 = !DILocation(line: 22, column: 25, scope: !29)
!32 = !DILocalVariable(name: "buffer", scope: !33, file: !13, line: 25, type: !34)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 24, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 25, column: 13, scope: !33)
!38 = !DILocation(line: 28, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 28, column: 13)
!40 = !DILocation(line: 28, column: 18, scope: !39)
!41 = !DILocation(line: 28, column: 13, scope: !33)
!42 = !DILocation(line: 30, column: 33, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !13, line: 29, column: 9)
!44 = !DILocation(line: 30, column: 26, scope: !43)
!45 = !DILocation(line: 30, column: 13, scope: !43)
!46 = !DILocation(line: 31, column: 9, scope: !43)
!47 = !DILocation(line: 34, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !13, line: 33, column: 9)
!49 = !DILocation(line: 37, column: 1, scope: !29)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_44_good", scope: !13, file: !13, line: 114, type: !14, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 116, column: 5, scope: !50)
!52 = !DILocation(line: 117, column: 5, scope: !50)
!53 = !DILocation(line: 118, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 128, type: !55, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!4, !4, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !13, line: 128, type: !4)
!61 = !DILocation(line: 128, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !13, line: 128, type: !57)
!63 = !DILocation(line: 128, column: 27, scope: !54)
!64 = !DILocation(line: 131, column: 22, scope: !54)
!65 = !DILocation(line: 131, column: 12, scope: !54)
!66 = !DILocation(line: 131, column: 5, scope: !54)
!67 = !DILocation(line: 133, column: 5, scope: !54)
!68 = !DILocation(line: 134, column: 5, scope: !54)
!69 = !DILocation(line: 135, column: 5, scope: !54)
!70 = !DILocation(line: 138, column: 5, scope: !54)
!71 = !DILocation(line: 139, column: 5, scope: !54)
!72 = !DILocation(line: 140, column: 5, scope: !54)
!73 = !DILocation(line: 142, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 74, type: !14, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !13, line: 76, type: !4)
!76 = !DILocation(line: 76, column: 9, scope: !74)
!77 = !DILocalVariable(name: "funcPtr", scope: !74, file: !13, line: 77, type: !19)
!78 = !DILocation(line: 77, column: 12, scope: !74)
!79 = !DILocation(line: 79, column: 10, scope: !74)
!80 = !DILocation(line: 82, column: 10, scope: !74)
!81 = !DILocation(line: 83, column: 5, scope: !74)
!82 = !DILocation(line: 83, column: 13, scope: !74)
!83 = !DILocation(line: 84, column: 1, scope: !74)
!84 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 57, type: !20, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !13, line: 57, type: !4)
!86 = !DILocation(line: 57, column: 29, scope: !84)
!87 = !DILocalVariable(name: "buffer", scope: !88, file: !13, line: 60, type: !34)
!88 = distinct !DILexicalBlock(scope: !84, file: !13, line: 59, column: 5)
!89 = !DILocation(line: 60, column: 13, scope: !88)
!90 = !DILocation(line: 63, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !13, line: 63, column: 13)
!92 = !DILocation(line: 63, column: 18, scope: !91)
!93 = !DILocation(line: 63, column: 13, scope: !88)
!94 = !DILocation(line: 65, column: 33, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !13, line: 64, column: 9)
!96 = !DILocation(line: 65, column: 26, scope: !95)
!97 = !DILocation(line: 65, column: 13, scope: !95)
!98 = !DILocation(line: 66, column: 9, scope: !95)
!99 = !DILocation(line: 69, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !91, file: !13, line: 68, column: 9)
!101 = !DILocation(line: 72, column: 1, scope: !84)
!102 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 103, type: !14, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !13, line: 105, type: !4)
!104 = !DILocation(line: 105, column: 9, scope: !102)
!105 = !DILocalVariable(name: "funcPtr", scope: !102, file: !13, line: 106, type: !19)
!106 = !DILocation(line: 106, column: 12, scope: !102)
!107 = !DILocation(line: 108, column: 10, scope: !102)
!108 = !DILocation(line: 110, column: 12, scope: !102)
!109 = !DILocation(line: 110, column: 10, scope: !102)
!110 = !DILocation(line: 111, column: 5, scope: !102)
!111 = !DILocation(line: 111, column: 13, scope: !102)
!112 = !DILocation(line: 112, column: 1, scope: !102)
!113 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 87, type: !20, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", arg: 1, scope: !113, file: !13, line: 87, type: !4)
!115 = !DILocation(line: 87, column: 29, scope: !113)
!116 = !DILocalVariable(name: "buffer", scope: !117, file: !13, line: 90, type: !34)
!117 = distinct !DILexicalBlock(scope: !113, file: !13, line: 89, column: 5)
!118 = !DILocation(line: 90, column: 13, scope: !117)
!119 = !DILocation(line: 92, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !13, line: 92, column: 13)
!121 = !DILocation(line: 92, column: 18, scope: !120)
!122 = !DILocation(line: 92, column: 23, scope: !120)
!123 = !DILocation(line: 92, column: 26, scope: !120)
!124 = !DILocation(line: 92, column: 31, scope: !120)
!125 = !DILocation(line: 92, column: 13, scope: !117)
!126 = !DILocation(line: 94, column: 33, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !13, line: 93, column: 9)
!128 = !DILocation(line: 94, column: 26, scope: !127)
!129 = !DILocation(line: 94, column: 13, scope: !127)
!130 = !DILocation(line: 95, column: 9, scope: !127)
!131 = !DILocation(line: 98, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !120, file: !13, line: 97, column: 9)
!133 = !DILocation(line: 101, column: 1, scope: !113)
