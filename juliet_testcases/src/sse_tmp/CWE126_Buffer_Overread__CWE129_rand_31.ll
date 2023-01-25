; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_31_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data14 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %data, align 4, !dbg !24
  store i32 %0, i32* %dataCopy, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %data14, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = load i32, i32* %dataCopy, align 4, !dbg !27
  store i32 %1, i32* %data14, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !28, metadata !DIExpression()), !dbg !33
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !33
  %3 = load i32, i32* %data14, align 4, !dbg !34
  %cmp = icmp sge i32 %3, 0, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %cond.end
  %4 = load i32, i32* %data14, align 4, !dbg !38
  %idxprom = sext i32 %4 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  %5 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %5), !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !45
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
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_31_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  call void @goodB2G(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @CWE126_Buffer_Overread__CWE129_rand_31_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__CWE129_rand_31_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  store i32 7, i32* %data, align 4, !dbg !74
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !75, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* %data, align 4, !dbg !78
  store i32 %0, i32* %dataCopy, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !79, metadata !DIExpression()), !dbg !80
  %1 = load i32, i32* %dataCopy, align 4, !dbg !81
  store i32 %1, i32* %data1, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !82, metadata !DIExpression()), !dbg !84
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !84
  %3 = load i32, i32* %data1, align 4, !dbg !85
  %cmp = icmp sge i32 %3, 0, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !89
  %idxprom = sext i32 %4 to i64, !dbg !91
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !91
  %5 = load i32, i32* %arrayidx, align 4, !dbg !91
  call void @printIntLine(i32 %5), !dbg !92
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data14 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  %call = call i32 @rand() #5, !dbg !101
  %and = and i32 %call, 1, !dbg !101
  %tobool = icmp ne i32 %and, 0, !dbg !101
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !101

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !101
  %shl = shl i32 %call1, 30, !dbg !101
  %call2 = call i32 @rand() #5, !dbg !101
  %shl3 = shl i32 %call2, 15, !dbg !101
  %xor = xor i32 %shl, %shl3, !dbg !101
  %call4 = call i32 @rand() #5, !dbg !101
  %xor5 = xor i32 %xor, %call4, !dbg !101
  br label %cond.end, !dbg !101

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !101
  %shl7 = shl i32 %call6, 30, !dbg !101
  %call8 = call i32 @rand() #5, !dbg !101
  %shl9 = shl i32 %call8, 15, !dbg !101
  %xor10 = xor i32 %shl7, %shl9, !dbg !101
  %call11 = call i32 @rand() #5, !dbg !101
  %xor12 = xor i32 %xor10, %call11, !dbg !101
  %sub = sub i32 0, %xor12, !dbg !101
  %sub13 = sub i32 %sub, 1, !dbg !101
  br label %cond.end, !dbg !101

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !101
  store i32 %cond, i32* %data, align 4, !dbg !102
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !103, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* %data, align 4, !dbg !106
  store i32 %0, i32* %dataCopy, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %data14, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = load i32, i32* %dataCopy, align 4, !dbg !109
  store i32 %1, i32* %data14, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !110, metadata !DIExpression()), !dbg !112
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !112
  %3 = load i32, i32* %data14, align 4, !dbg !113
  %cmp = icmp sge i32 %3, 0, !dbg !115
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !116

land.lhs.true:                                    ; preds = %cond.end
  %4 = load i32, i32* %data14, align 4, !dbg !117
  %cmp15 = icmp slt i32 %4, 10, !dbg !118
  br i1 %cmp15, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data14, align 4, !dbg !120
  %idxprom = sext i32 %5 to i64, !dbg !122
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !122
  %6 = load i32, i32* %arrayidx, align 4, !dbg !122
  call void @printIntLine(i32 %6), !dbg !123
  br label %if.end, !dbg !124

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_31_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_31.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 28, column: 12, scope: !12)
!20 = !DILocation(line: 28, column: 10, scope: !12)
!21 = !DILocalVariable(name: "dataCopy", scope: !22, file: !13, line: 30, type: !4)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!23 = !DILocation(line: 30, column: 13, scope: !22)
!24 = !DILocation(line: 30, column: 24, scope: !22)
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 31, type: !4)
!26 = !DILocation(line: 31, column: 13, scope: !22)
!27 = !DILocation(line: 31, column: 20, scope: !22)
!28 = !DILocalVariable(name: "buffer", scope: !29, file: !13, line: 33, type: !30)
!29 = distinct !DILexicalBlock(scope: !22, file: !13, line: 32, column: 9)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 33, column: 17, scope: !29)
!34 = !DILocation(line: 36, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !13, line: 36, column: 17)
!36 = !DILocation(line: 36, column: 22, scope: !35)
!37 = !DILocation(line: 36, column: 17, scope: !29)
!38 = !DILocation(line: 38, column: 37, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 37, column: 13)
!40 = !DILocation(line: 38, column: 30, scope: !39)
!41 = !DILocation(line: 38, column: 17, scope: !39)
!42 = !DILocation(line: 39, column: 13, scope: !39)
!43 = !DILocation(line: 42, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !13, line: 41, column: 13)
!45 = !DILocation(line: 46, column: 1, scope: !12)
!46 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_31_good", scope: !13, file: !13, line: 106, type: !14, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 108, column: 5, scope: !46)
!48 = !DILocation(line: 109, column: 5, scope: !46)
!49 = !DILocation(line: 110, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 120, type: !51, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!4, !4, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !13, line: 120, type: !4)
!57 = !DILocation(line: 120, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !13, line: 120, type: !53)
!59 = !DILocation(line: 120, column: 27, scope: !50)
!60 = !DILocation(line: 123, column: 22, scope: !50)
!61 = !DILocation(line: 123, column: 12, scope: !50)
!62 = !DILocation(line: 123, column: 5, scope: !50)
!63 = !DILocation(line: 125, column: 5, scope: !50)
!64 = !DILocation(line: 126, column: 5, scope: !50)
!65 = !DILocation(line: 127, column: 5, scope: !50)
!66 = !DILocation(line: 130, column: 5, scope: !50)
!67 = !DILocation(line: 131, column: 5, scope: !50)
!68 = !DILocation(line: 132, column: 5, scope: !50)
!69 = !DILocation(line: 134, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 53, type: !14, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !13, line: 55, type: !4)
!72 = !DILocation(line: 55, column: 9, scope: !70)
!73 = !DILocation(line: 57, column: 10, scope: !70)
!74 = !DILocation(line: 60, column: 10, scope: !70)
!75 = !DILocalVariable(name: "dataCopy", scope: !76, file: !13, line: 62, type: !4)
!76 = distinct !DILexicalBlock(scope: !70, file: !13, line: 61, column: 5)
!77 = !DILocation(line: 62, column: 13, scope: !76)
!78 = !DILocation(line: 62, column: 24, scope: !76)
!79 = !DILocalVariable(name: "data", scope: !76, file: !13, line: 63, type: !4)
!80 = !DILocation(line: 63, column: 13, scope: !76)
!81 = !DILocation(line: 63, column: 20, scope: !76)
!82 = !DILocalVariable(name: "buffer", scope: !83, file: !13, line: 65, type: !30)
!83 = distinct !DILexicalBlock(scope: !76, file: !13, line: 64, column: 9)
!84 = !DILocation(line: 65, column: 17, scope: !83)
!85 = !DILocation(line: 68, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !13, line: 68, column: 17)
!87 = !DILocation(line: 68, column: 22, scope: !86)
!88 = !DILocation(line: 68, column: 17, scope: !83)
!89 = !DILocation(line: 70, column: 37, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !13, line: 69, column: 13)
!91 = !DILocation(line: 70, column: 30, scope: !90)
!92 = !DILocation(line: 70, column: 17, scope: !90)
!93 = !DILocation(line: 71, column: 13, scope: !90)
!94 = !DILocation(line: 74, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !86, file: !13, line: 73, column: 13)
!96 = !DILocation(line: 78, column: 1, scope: !70)
!97 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 81, type: !14, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !13, line: 83, type: !4)
!99 = !DILocation(line: 83, column: 9, scope: !97)
!100 = !DILocation(line: 85, column: 10, scope: !97)
!101 = !DILocation(line: 87, column: 12, scope: !97)
!102 = !DILocation(line: 87, column: 10, scope: !97)
!103 = !DILocalVariable(name: "dataCopy", scope: !104, file: !13, line: 89, type: !4)
!104 = distinct !DILexicalBlock(scope: !97, file: !13, line: 88, column: 5)
!105 = !DILocation(line: 89, column: 13, scope: !104)
!106 = !DILocation(line: 89, column: 24, scope: !104)
!107 = !DILocalVariable(name: "data", scope: !104, file: !13, line: 90, type: !4)
!108 = !DILocation(line: 90, column: 13, scope: !104)
!109 = !DILocation(line: 90, column: 20, scope: !104)
!110 = !DILocalVariable(name: "buffer", scope: !111, file: !13, line: 92, type: !30)
!111 = distinct !DILexicalBlock(scope: !104, file: !13, line: 91, column: 9)
!112 = !DILocation(line: 92, column: 17, scope: !111)
!113 = !DILocation(line: 94, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !13, line: 94, column: 17)
!115 = !DILocation(line: 94, column: 22, scope: !114)
!116 = !DILocation(line: 94, column: 27, scope: !114)
!117 = !DILocation(line: 94, column: 30, scope: !114)
!118 = !DILocation(line: 94, column: 35, scope: !114)
!119 = !DILocation(line: 94, column: 17, scope: !111)
!120 = !DILocation(line: 96, column: 37, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !13, line: 95, column: 13)
!122 = !DILocation(line: 96, column: 30, scope: !121)
!123 = !DILocation(line: 96, column: 17, scope: !121)
!124 = !DILocation(line: 97, column: 13, scope: !121)
!125 = !DILocation(line: 100, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !114, file: !13, line: 99, column: 13)
!127 = !DILocation(line: 104, column: 1, scope: !97)
