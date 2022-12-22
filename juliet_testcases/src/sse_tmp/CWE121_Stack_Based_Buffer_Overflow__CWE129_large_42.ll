; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* %data, align 4, !dbg !19
  %call = call i32 @badSource(i32 %0), !dbg !20
  store i32 %call, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !25, metadata !DIExpression()), !dbg !29
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !29
  %2 = load i32, i32* %data, align 4, !dbg !30
  %cmp = icmp sge i32 %2, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !34
  %idxprom = sext i32 %3 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !36
  store i32 1, i32* %arrayidx, align 4, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !41
  %cmp1 = icmp slt i32 %4, 10, !dbg !43
  br i1 %cmp1, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !45
  %idxprom2 = sext i32 %5 to i64, !dbg !47
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !47
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !47
  call void @printIntLine(i32 %6), !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %7, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !56
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 10, i32* %data.addr, align 4, !dbg !64
  %0 = load i32, i32* %data.addr, align 4, !dbg !65
  ret i32 %0, !dbg !66
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_good() #0 !dbg !67 {
entry:
  call void @goodB2G(), !dbg !68
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !91 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32 -1, i32* %data, align 4, !dbg !94
  %0 = load i32, i32* %data, align 4, !dbg !95
  %call = call i32 @goodB2GSource(i32 %0), !dbg !96
  store i32 %call, i32* %data, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %i, metadata !98, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !101, metadata !DIExpression()), !dbg !102
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !102
  %2 = load i32, i32* %data, align 4, !dbg !103
  %cmp = icmp sge i32 %2, 0, !dbg !105
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !106

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !107
  %cmp1 = icmp slt i32 %3, 10, !dbg !108
  br i1 %cmp1, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !110
  %idxprom = sext i32 %4 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !112
  store i32 1, i32* %arrayidx, align 4, !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !117
  %cmp2 = icmp slt i32 %5, 10, !dbg !119
  br i1 %cmp2, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !121
  %idxprom3 = sext i32 %6 to i64, !dbg !123
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !123
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !123
  call void @printIntLine(i32 %7), !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !126
  %inc = add nsw i32 %8, 1, !dbg !126
  store i32 %inc, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !130

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !134 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 10, i32* %data.addr, align 4, !dbg !137
  %0 = load i32, i32* %data.addr, align 4, !dbg !138
  ret i32 %0, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !140 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !141, metadata !DIExpression()), !dbg !142
  store i32 -1, i32* %data, align 4, !dbg !143
  %0 = load i32, i32* %data, align 4, !dbg !144
  %call = call i32 @goodG2BSource(i32 %0), !dbg !145
  store i32 %call, i32* %data, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !150, metadata !DIExpression()), !dbg !151
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !151
  %2 = load i32, i32* %data, align 4, !dbg !152
  %cmp = icmp sge i32 %2, 0, !dbg !154
  br i1 %cmp, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !156
  %idxprom = sext i32 %3 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !158
  store i32 1, i32* %arrayidx, align 4, !dbg !159
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !163
  %cmp1 = icmp slt i32 %4, 10, !dbg !165
  br i1 %cmp1, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !167
  %idxprom2 = sext i32 %5 to i64, !dbg !169
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !169
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !169
  call void @printIntLine(i32 %6), !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %7, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !176

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !177
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !180 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !181, metadata !DIExpression()), !dbg !182
  store i32 7, i32* %data.addr, align 4, !dbg !183
  %0 = load i32, i32* %data.addr, align 4, !dbg !184
  ret i32 %0, !dbg !185
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 31, column: 9, scope: !11)
!18 = !DILocation(line: 33, column: 10, scope: !11)
!19 = !DILocation(line: 34, column: 22, scope: !11)
!20 = !DILocation(line: 34, column: 12, scope: !11)
!21 = !DILocation(line: 34, column: 10, scope: !11)
!22 = !DILocalVariable(name: "i", scope: !23, file: !12, line: 36, type: !16)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!24 = !DILocation(line: 36, column: 13, scope: !23)
!25 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 37, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 37, column: 13, scope: !23)
!30 = !DILocation(line: 40, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !12, line: 40, column: 13)
!32 = !DILocation(line: 40, column: 18, scope: !31)
!33 = !DILocation(line: 40, column: 13, scope: !23)
!34 = !DILocation(line: 42, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 41, column: 9)
!36 = !DILocation(line: 42, column: 13, scope: !35)
!37 = !DILocation(line: 42, column: 26, scope: !35)
!38 = !DILocation(line: 44, column: 19, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 44, column: 13)
!40 = !DILocation(line: 44, column: 17, scope: !39)
!41 = !DILocation(line: 44, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 44, column: 13)
!43 = !DILocation(line: 44, column: 26, scope: !42)
!44 = !DILocation(line: 44, column: 13, scope: !39)
!45 = !DILocation(line: 46, column: 37, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 45, column: 13)
!47 = !DILocation(line: 46, column: 30, scope: !46)
!48 = !DILocation(line: 46, column: 17, scope: !46)
!49 = !DILocation(line: 47, column: 13, scope: !46)
!50 = !DILocation(line: 44, column: 33, scope: !42)
!51 = !DILocation(line: 44, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 47, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 48, column: 9, scope: !35)
!56 = !DILocation(line: 51, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !31, file: !12, line: 50, column: 9)
!58 = !DILocation(line: 54, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 22, type: !60, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!16, !16}
!62 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !12, line: 22, type: !16)
!63 = !DILocation(line: 22, column: 26, scope: !59)
!64 = !DILocation(line: 25, column: 10, scope: !59)
!65 = !DILocation(line: 26, column: 12, scope: !59)
!66 = !DILocation(line: 26, column: 5, scope: !59)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 132, column: 5, scope: !67)
!69 = !DILocation(line: 133, column: 5, scope: !67)
!70 = !DILocation(line: 134, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 145, type: !72, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!16, !16, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 145, type: !16)
!78 = !DILocation(line: 145, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 145, type: !74)
!80 = !DILocation(line: 145, column: 27, scope: !71)
!81 = !DILocation(line: 148, column: 22, scope: !71)
!82 = !DILocation(line: 148, column: 12, scope: !71)
!83 = !DILocation(line: 148, column: 5, scope: !71)
!84 = !DILocation(line: 150, column: 5, scope: !71)
!85 = !DILocation(line: 151, column: 5, scope: !71)
!86 = !DILocation(line: 152, column: 5, scope: !71)
!87 = !DILocation(line: 155, column: 5, scope: !71)
!88 = !DILocation(line: 156, column: 5, scope: !71)
!89 = !DILocation(line: 157, column: 5, scope: !71)
!90 = !DILocation(line: 159, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 106, type: !16)
!93 = !DILocation(line: 106, column: 9, scope: !91)
!94 = !DILocation(line: 108, column: 10, scope: !91)
!95 = !DILocation(line: 109, column: 26, scope: !91)
!96 = !DILocation(line: 109, column: 12, scope: !91)
!97 = !DILocation(line: 109, column: 10, scope: !91)
!98 = !DILocalVariable(name: "i", scope: !99, file: !12, line: 111, type: !16)
!99 = distinct !DILexicalBlock(scope: !91, file: !12, line: 110, column: 5)
!100 = !DILocation(line: 111, column: 13, scope: !99)
!101 = !DILocalVariable(name: "buffer", scope: !99, file: !12, line: 112, type: !26)
!102 = !DILocation(line: 112, column: 13, scope: !99)
!103 = !DILocation(line: 114, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !12, line: 114, column: 13)
!105 = !DILocation(line: 114, column: 18, scope: !104)
!106 = !DILocation(line: 114, column: 23, scope: !104)
!107 = !DILocation(line: 114, column: 26, scope: !104)
!108 = !DILocation(line: 114, column: 31, scope: !104)
!109 = !DILocation(line: 114, column: 13, scope: !99)
!110 = !DILocation(line: 116, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !12, line: 115, column: 9)
!112 = !DILocation(line: 116, column: 13, scope: !111)
!113 = !DILocation(line: 116, column: 26, scope: !111)
!114 = !DILocation(line: 118, column: 19, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 118, column: 13)
!116 = !DILocation(line: 118, column: 17, scope: !115)
!117 = !DILocation(line: 118, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 118, column: 13)
!119 = !DILocation(line: 118, column: 26, scope: !118)
!120 = !DILocation(line: 118, column: 13, scope: !115)
!121 = !DILocation(line: 120, column: 37, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 119, column: 13)
!123 = !DILocation(line: 120, column: 30, scope: !122)
!124 = !DILocation(line: 120, column: 17, scope: !122)
!125 = !DILocation(line: 121, column: 13, scope: !122)
!126 = !DILocation(line: 118, column: 33, scope: !118)
!127 = !DILocation(line: 118, column: 13, scope: !118)
!128 = distinct !{!128, !120, !129, !54}
!129 = !DILocation(line: 121, column: 13, scope: !115)
!130 = !DILocation(line: 122, column: 9, scope: !111)
!131 = !DILocation(line: 125, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !104, file: !12, line: 124, column: 9)
!133 = !DILocation(line: 128, column: 1, scope: !91)
!134 = distinct !DISubprogram(name: "goodB2GSource", scope: !12, file: !12, line: 97, type: !60, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", arg: 1, scope: !134, file: !12, line: 97, type: !16)
!136 = !DILocation(line: 97, column: 30, scope: !134)
!137 = !DILocation(line: 100, column: 10, scope: !134)
!138 = !DILocation(line: 101, column: 12, scope: !134)
!139 = !DILocation(line: 101, column: 5, scope: !134)
!140 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DILocalVariable(name: "data", scope: !140, file: !12, line: 71, type: !16)
!142 = !DILocation(line: 71, column: 9, scope: !140)
!143 = !DILocation(line: 73, column: 10, scope: !140)
!144 = !DILocation(line: 74, column: 26, scope: !140)
!145 = !DILocation(line: 74, column: 12, scope: !140)
!146 = !DILocation(line: 74, column: 10, scope: !140)
!147 = !DILocalVariable(name: "i", scope: !148, file: !12, line: 76, type: !16)
!148 = distinct !DILexicalBlock(scope: !140, file: !12, line: 75, column: 5)
!149 = !DILocation(line: 76, column: 13, scope: !148)
!150 = !DILocalVariable(name: "buffer", scope: !148, file: !12, line: 77, type: !26)
!151 = !DILocation(line: 77, column: 13, scope: !148)
!152 = !DILocation(line: 80, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 80, column: 13)
!154 = !DILocation(line: 80, column: 18, scope: !153)
!155 = !DILocation(line: 80, column: 13, scope: !148)
!156 = !DILocation(line: 82, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !12, line: 81, column: 9)
!158 = !DILocation(line: 82, column: 13, scope: !157)
!159 = !DILocation(line: 82, column: 26, scope: !157)
!160 = !DILocation(line: 84, column: 19, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 84, column: 13)
!162 = !DILocation(line: 84, column: 17, scope: !161)
!163 = !DILocation(line: 84, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 84, column: 13)
!165 = !DILocation(line: 84, column: 26, scope: !164)
!166 = !DILocation(line: 84, column: 13, scope: !161)
!167 = !DILocation(line: 86, column: 37, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !12, line: 85, column: 13)
!169 = !DILocation(line: 86, column: 30, scope: !168)
!170 = !DILocation(line: 86, column: 17, scope: !168)
!171 = !DILocation(line: 87, column: 13, scope: !168)
!172 = !DILocation(line: 84, column: 33, scope: !164)
!173 = !DILocation(line: 84, column: 13, scope: !164)
!174 = distinct !{!174, !166, !175, !54}
!175 = !DILocation(line: 87, column: 13, scope: !161)
!176 = !DILocation(line: 88, column: 9, scope: !157)
!177 = !DILocation(line: 91, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !153, file: !12, line: 90, column: 9)
!179 = !DILocation(line: 94, column: 1, scope: !140)
!180 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 61, type: !60, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DILocalVariable(name: "data", arg: 1, scope: !180, file: !12, line: 61, type: !16)
!182 = !DILocation(line: 61, column: 30, scope: !180)
!183 = !DILocation(line: 65, column: 10, scope: !180)
!184 = !DILocation(line: 66, column: 12, scope: !180)
!185 = !DILocation(line: 66, column: 5, scope: !180)
