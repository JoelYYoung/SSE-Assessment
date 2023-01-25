; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__CWE129_rand_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@CWE126_Buffer_Overread__CWE129_rand_45_goodG2BData = internal global i32 0, align 4, !dbg !9
@CWE126_Buffer_Overread__CWE129_rand_45_goodB2GData = internal global i32 0, align 4, !dbg !12
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %call = call i32 @rand() #5, !dbg !26
  %and = and i32 %call, 1, !dbg !26
  %tobool = icmp ne i32 %and, 0, !dbg !26
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !26

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !26
  %shl = shl i32 %call1, 30, !dbg !26
  %call2 = call i32 @rand() #5, !dbg !26
  %shl3 = shl i32 %call2, 15, !dbg !26
  %xor = xor i32 %shl, %shl3, !dbg !26
  %call4 = call i32 @rand() #5, !dbg !26
  %xor5 = xor i32 %xor, %call4, !dbg !26
  br label %cond.end, !dbg !26

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !26
  %shl7 = shl i32 %call6, 30, !dbg !26
  %call8 = call i32 @rand() #5, !dbg !26
  %shl9 = shl i32 %call8, 15, !dbg !26
  %xor10 = xor i32 %shl7, %shl9, !dbg !26
  %call11 = call i32 @rand() #5, !dbg !26
  %xor12 = xor i32 %xor10, %call11, !dbg !26
  %sub = sub i32 0, %xor12, !dbg !26
  %sub13 = sub i32 %sub, 1, !dbg !26
  br label %cond.end, !dbg !26

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !26
  store i32 %cond, i32* %data, align 4, !dbg !27
  %0 = load i32, i32* %data, align 4, !dbg !28
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_rand_45_badData, align 4, !dbg !29
  call void @badSink(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_45_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
  call void @goodB2G(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* null) #5, !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 %conv) #5, !dbg !48
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @CWE126_Buffer_Overread__CWE129_rand_45_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !52
  call void @CWE126_Buffer_Overread__CWE129_rand_45_bad(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_rand_45_badData, align 4, !dbg !59
  store i32 %0, i32* %data, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !60, metadata !DIExpression()), !dbg !65
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !65
  %2 = load i32, i32* %data, align 4, !dbg !66
  %cmp = icmp sge i32 %2, 0, !dbg !68
  br i1 %cmp, label %if.then, label %if.else, !dbg !69

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !70
  %idxprom = sext i32 %3 to i64, !dbg !72
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !72
  %4 = load i32, i32* %arrayidx, align 4, !dbg !72
  call void @printIntLine(i32 %4), !dbg !73
  br label %if.end, !dbg !74

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !77
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 -1, i32* %data, align 4, !dbg !81
  store i32 7, i32* %data, align 4, !dbg !82
  %0 = load i32, i32* %data, align 4, !dbg !83
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_rand_45_goodG2BData, align 4, !dbg !84
  call void @goodG2BSink(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_rand_45_goodG2BData, align 4, !dbg !90
  store i32 %0, i32* %data, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !91, metadata !DIExpression()), !dbg !93
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !93
  %2 = load i32, i32* %data, align 4, !dbg !94
  %cmp = icmp sge i32 %2, 0, !dbg !96
  br i1 %cmp, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !98
  %idxprom = sext i32 %3 to i64, !dbg !100
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !100
  %4 = load i32, i32* %arrayidx, align 4, !dbg !100
  call void @printIntLine(i32 %4), !dbg !101
  br label %if.end, !dbg !102

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  %call = call i32 @rand() #5, !dbg !110
  %and = and i32 %call, 1, !dbg !110
  %tobool = icmp ne i32 %and, 0, !dbg !110
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !110

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !110
  %shl = shl i32 %call1, 30, !dbg !110
  %call2 = call i32 @rand() #5, !dbg !110
  %shl3 = shl i32 %call2, 15, !dbg !110
  %xor = xor i32 %shl, %shl3, !dbg !110
  %call4 = call i32 @rand() #5, !dbg !110
  %xor5 = xor i32 %xor, %call4, !dbg !110
  br label %cond.end, !dbg !110

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !110
  %shl7 = shl i32 %call6, 30, !dbg !110
  %call8 = call i32 @rand() #5, !dbg !110
  %shl9 = shl i32 %call8, 15, !dbg !110
  %xor10 = xor i32 %shl7, %shl9, !dbg !110
  %call11 = call i32 @rand() #5, !dbg !110
  %xor12 = xor i32 %xor10, %call11, !dbg !110
  %sub = sub i32 0, %xor12, !dbg !110
  %sub13 = sub i32 %sub, 1, !dbg !110
  br label %cond.end, !dbg !110

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !110
  store i32 %cond, i32* %data, align 4, !dbg !111
  %0 = load i32, i32* %data, align 4, !dbg !112
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_rand_45_goodB2GData, align 4, !dbg !113
  call void @goodB2GSink(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !116 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_rand_45_goodB2GData, align 4, !dbg !119
  store i32 %0, i32* %data, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !120, metadata !DIExpression()), !dbg !122
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !122
  %2 = load i32, i32* %data, align 4, !dbg !123
  %cmp = icmp sge i32 %2, 0, !dbg !125
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !126

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !127
  %cmp1 = icmp slt i32 %3, 10, !dbg !128
  br i1 %cmp1, label %if.then, label %if.else, !dbg !129

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !130
  %idxprom = sext i32 %4 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !132
  %5 = load i32, i32* %arrayidx, align 4, !dbg !132
  call void @printIntLine(i32 %5), !dbg !133
  br label %if.end, !dbg !134

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !135
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_rand_45_badData", scope: !2, file: !11, line: 20, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !12}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_rand_45_goodG2BData", scope: !2, file: !11, line: 21, type: !6, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_45.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_rand_45_goodB2GData", scope: !2, file: !11, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_45_bad", scope: !11, file: !11, line: 44, type: !21, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !11, line: 46, type: !6)
!24 = !DILocation(line: 46, column: 9, scope: !20)
!25 = !DILocation(line: 48, column: 10, scope: !20)
!26 = !DILocation(line: 50, column: 12, scope: !20)
!27 = !DILocation(line: 50, column: 10, scope: !20)
!28 = !DILocation(line: 51, column: 54, scope: !20)
!29 = !DILocation(line: 51, column: 52, scope: !20)
!30 = !DILocation(line: 52, column: 5, scope: !20)
!31 = !DILocation(line: 53, column: 1, scope: !20)
!32 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_45_good", scope: !11, file: !11, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocation(line: 121, column: 5, scope: !32)
!34 = !DILocation(line: 122, column: 5, scope: !32)
!35 = !DILocation(line: 123, column: 1, scope: !32)
!36 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 133, type: !37, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{!6, !6, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !11, line: 133, type: !6)
!43 = !DILocation(line: 133, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !11, line: 133, type: !39)
!45 = !DILocation(line: 133, column: 27, scope: !36)
!46 = !DILocation(line: 136, column: 22, scope: !36)
!47 = !DILocation(line: 136, column: 12, scope: !36)
!48 = !DILocation(line: 136, column: 5, scope: !36)
!49 = !DILocation(line: 138, column: 5, scope: !36)
!50 = !DILocation(line: 139, column: 5, scope: !36)
!51 = !DILocation(line: 140, column: 5, scope: !36)
!52 = !DILocation(line: 143, column: 5, scope: !36)
!53 = !DILocation(line: 144, column: 5, scope: !36)
!54 = !DILocation(line: 145, column: 5, scope: !36)
!55 = !DILocation(line: 147, column: 5, scope: !36)
!56 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocalVariable(name: "data", scope: !56, file: !11, line: 28, type: !6)
!58 = !DILocation(line: 28, column: 9, scope: !56)
!59 = !DILocation(line: 28, column: 16, scope: !56)
!60 = !DILocalVariable(name: "buffer", scope: !61, file: !11, line: 30, type: !62)
!61 = distinct !DILexicalBlock(scope: !56, file: !11, line: 29, column: 5)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 10)
!65 = !DILocation(line: 30, column: 13, scope: !61)
!66 = !DILocation(line: 33, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !11, line: 33, column: 13)
!68 = !DILocation(line: 33, column: 18, scope: !67)
!69 = !DILocation(line: 33, column: 13, scope: !61)
!70 = !DILocation(line: 35, column: 33, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !11, line: 34, column: 9)
!72 = !DILocation(line: 35, column: 26, scope: !71)
!73 = !DILocation(line: 35, column: 13, scope: !71)
!74 = !DILocation(line: 36, column: 9, scope: !71)
!75 = !DILocation(line: 39, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !67, file: !11, line: 38, column: 9)
!77 = !DILocation(line: 42, column: 1, scope: !56)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !11, line: 80, type: !6)
!80 = !DILocation(line: 80, column: 9, scope: !78)
!81 = !DILocation(line: 82, column: 10, scope: !78)
!82 = !DILocation(line: 85, column: 10, scope: !78)
!83 = !DILocation(line: 86, column: 58, scope: !78)
!84 = !DILocation(line: 86, column: 56, scope: !78)
!85 = !DILocation(line: 87, column: 5, scope: !78)
!86 = !DILocation(line: 88, column: 1, scope: !78)
!87 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !11, line: 62, type: !6)
!89 = !DILocation(line: 62, column: 9, scope: !87)
!90 = !DILocation(line: 62, column: 16, scope: !87)
!91 = !DILocalVariable(name: "buffer", scope: !92, file: !11, line: 64, type: !62)
!92 = distinct !DILexicalBlock(scope: !87, file: !11, line: 63, column: 5)
!93 = !DILocation(line: 64, column: 13, scope: !92)
!94 = !DILocation(line: 67, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !11, line: 67, column: 13)
!96 = !DILocation(line: 67, column: 18, scope: !95)
!97 = !DILocation(line: 67, column: 13, scope: !92)
!98 = !DILocation(line: 69, column: 33, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !11, line: 68, column: 9)
!100 = !DILocation(line: 69, column: 26, scope: !99)
!101 = !DILocation(line: 69, column: 13, scope: !99)
!102 = !DILocation(line: 70, column: 9, scope: !99)
!103 = !DILocation(line: 73, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !11, line: 72, column: 9)
!105 = !DILocation(line: 76, column: 1, scope: !87)
!106 = distinct !DISubprogram(name: "goodB2G", scope: !11, file: !11, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !11, line: 110, type: !6)
!108 = !DILocation(line: 110, column: 9, scope: !106)
!109 = !DILocation(line: 112, column: 10, scope: !106)
!110 = !DILocation(line: 114, column: 12, scope: !106)
!111 = !DILocation(line: 114, column: 10, scope: !106)
!112 = !DILocation(line: 115, column: 58, scope: !106)
!113 = !DILocation(line: 115, column: 56, scope: !106)
!114 = !DILocation(line: 116, column: 5, scope: !106)
!115 = !DILocation(line: 117, column: 1, scope: !106)
!116 = distinct !DISubprogram(name: "goodB2GSink", scope: !11, file: !11, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !11, line: 93, type: !6)
!118 = !DILocation(line: 93, column: 9, scope: !116)
!119 = !DILocation(line: 93, column: 16, scope: !116)
!120 = !DILocalVariable(name: "buffer", scope: !121, file: !11, line: 95, type: !62)
!121 = distinct !DILexicalBlock(scope: !116, file: !11, line: 94, column: 5)
!122 = !DILocation(line: 95, column: 13, scope: !121)
!123 = !DILocation(line: 97, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !11, line: 97, column: 13)
!125 = !DILocation(line: 97, column: 18, scope: !124)
!126 = !DILocation(line: 97, column: 23, scope: !124)
!127 = !DILocation(line: 97, column: 26, scope: !124)
!128 = !DILocation(line: 97, column: 31, scope: !124)
!129 = !DILocation(line: 97, column: 13, scope: !121)
!130 = !DILocation(line: 99, column: 33, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !11, line: 98, column: 9)
!132 = !DILocation(line: 99, column: 26, scope: !131)
!133 = !DILocation(line: 99, column: 13, scope: !131)
!134 = !DILocation(line: 100, column: 9, scope: !131)
!135 = !DILocation(line: 103, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !124, file: !11, line: 102, column: 9)
!137 = !DILocation(line: 106, column: 1, scope: !116)
