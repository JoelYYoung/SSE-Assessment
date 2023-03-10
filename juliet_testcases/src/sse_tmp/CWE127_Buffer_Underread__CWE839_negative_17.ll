; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %j, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %data, align 4, !dbg !22
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %cmp = icmp slt i32 %0, 1, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  store i32 -5, i32* %data, align 4, !dbg !30
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !33
  %inc = add nsw i32 %1, 1, !dbg !33
  store i32 %inc, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !38
  br label %for.cond1, !dbg !40

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !41
  %cmp2 = icmp slt i32 %2, 1, !dbg !43
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !44

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !45, metadata !DIExpression()), !dbg !51
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !51
  %4 = load i32, i32* %data, align 4, !dbg !52
  %cmp4 = icmp slt i32 %4, 10, !dbg !54
  br i1 %cmp4, label %if.then, label %if.else, !dbg !55

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !56
  %idxprom = sext i32 %5 to i64, !dbg !58
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !58
  %6 = load i32, i32* %arrayidx, align 4, !dbg !58
  call void @printIntLine(i32 %6), !dbg !59
  br label %if.end, !dbg !60

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !61
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !63

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !64
  %inc6 = add nsw i32 %7, 1, !dbg !64
  store i32 %inc6, i32* %j, align 4, !dbg !64
  br label %for.cond1, !dbg !65, !llvm.loop !66

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_17_good() #0 !dbg !69 {
entry:
  call void @goodB2G(), !dbg !70
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__CWE839_negative_17_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__CWE839_negative_17_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !93 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %k, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !104
  %cmp = icmp slt i32 %0, 1, !dbg !106
  br i1 %cmp, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  store i32 -5, i32* %data, align 4, !dbg !108
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !111
  %inc = add nsw i32 %1, 1, !dbg !111
  store i32 %inc, i32* %i, align 4, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !115
  br label %for.cond1, !dbg !117

for.cond1:                                        ; preds = %for.inc6, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !118
  %cmp2 = icmp slt i32 %2, 1, !dbg !120
  br i1 %cmp2, label %for.body3, label %for.end8, !dbg !121

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !122, metadata !DIExpression()), !dbg !125
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !125
  %4 = load i32, i32* %data, align 4, !dbg !126
  %cmp4 = icmp sge i32 %4, 0, !dbg !128
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !129

land.lhs.true:                                    ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !130
  %cmp5 = icmp slt i32 %5, 10, !dbg !131
  br i1 %cmp5, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !133
  %idxprom = sext i32 %6 to i64, !dbg !135
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !135
  %7 = load i32, i32* %arrayidx, align 4, !dbg !135
  call void @printIntLine(i32 %7), !dbg !136
  br label %if.end, !dbg !137

if.else:                                          ; preds = %land.lhs.true, %for.body3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc6, !dbg !140

for.inc6:                                         ; preds = %if.end
  %8 = load i32, i32* %k, align 4, !dbg !141
  %inc7 = add nsw i32 %8, 1, !dbg !141
  store i32 %inc7, i32* %k, align 4, !dbg !141
  br label %for.cond1, !dbg !142, !llvm.loop !143

for.end8:                                         ; preds = %for.cond1
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !146 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %j, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 -1, i32* %data, align 4, !dbg !153
  store i32 0, i32* %h, align 4, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !157
  %cmp = icmp slt i32 %0, 1, !dbg !159
  br i1 %cmp, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !161
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !164
  %inc = add nsw i32 %1, 1, !dbg !164
  store i32 %inc, i32* %h, align 4, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !168
  br label %for.cond1, !dbg !170

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !171
  %cmp2 = icmp slt i32 %2, 1, !dbg !173
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !174

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !175, metadata !DIExpression()), !dbg !178
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !178
  %4 = load i32, i32* %data, align 4, !dbg !179
  %cmp4 = icmp slt i32 %4, 10, !dbg !181
  br i1 %cmp4, label %if.then, label %if.else, !dbg !182

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !183
  %idxprom = sext i32 %5 to i64, !dbg !185
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !185
  %6 = load i32, i32* %arrayidx, align 4, !dbg !185
  call void @printIntLine(i32 %6), !dbg !186
  br label %if.end, !dbg !187

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !188
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !190

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !191
  %inc6 = add nsw i32 %7, 1, !dbg !191
  store i32 %inc6, i32* %j, align 4, !dbg !191
  br label %for.cond1, !dbg !192, !llvm.loop !193

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !195
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocalVariable(name: "j", scope: !11, file: !12, line: 24, type: !16)
!19 = !DILocation(line: 24, column: 11, scope: !11)
!20 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!21 = !DILocation(line: 25, column: 9, scope: !11)
!22 = !DILocation(line: 27, column: 10, scope: !11)
!23 = !DILocation(line: 28, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 28, column: 9, scope: !24)
!26 = !DILocation(line: 28, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !12, line: 28, column: 5)
!28 = !DILocation(line: 28, column: 18, scope: !27)
!29 = !DILocation(line: 28, column: 5, scope: !24)
!30 = !DILocation(line: 31, column: 14, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 5, scope: !31)
!33 = !DILocation(line: 28, column: 24, scope: !27)
!34 = !DILocation(line: 28, column: 5, scope: !27)
!35 = distinct !{!35, !29, !36, !37}
!36 = !DILocation(line: 32, column: 5, scope: !24)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !DILocation(line: 33, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 33, column: 9, scope: !39)
!41 = !DILocation(line: 33, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 33, column: 5)
!43 = !DILocation(line: 33, column: 18, scope: !42)
!44 = !DILocation(line: 33, column: 5, scope: !39)
!45 = !DILocalVariable(name: "buffer", scope: !46, file: !12, line: 36, type: !48)
!46 = distinct !DILexicalBlock(scope: !47, file: !12, line: 35, column: 9)
!47 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 10)
!51 = !DILocation(line: 36, column: 17, scope: !46)
!52 = !DILocation(line: 39, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !46, file: !12, line: 39, column: 17)
!54 = !DILocation(line: 39, column: 22, scope: !53)
!55 = !DILocation(line: 39, column: 17, scope: !46)
!56 = !DILocation(line: 41, column: 37, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 40, column: 13)
!58 = !DILocation(line: 41, column: 30, scope: !57)
!59 = !DILocation(line: 41, column: 17, scope: !57)
!60 = !DILocation(line: 42, column: 13, scope: !57)
!61 = !DILocation(line: 45, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !53, file: !12, line: 44, column: 13)
!63 = !DILocation(line: 48, column: 5, scope: !47)
!64 = !DILocation(line: 33, column: 24, scope: !42)
!65 = !DILocation(line: 33, column: 5, scope: !42)
!66 = distinct !{!66, !44, !67, !37}
!67 = !DILocation(line: 48, column: 5, scope: !39)
!68 = !DILocation(line: 49, column: 1, scope: !11)
!69 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_17_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 117, column: 5, scope: !69)
!71 = !DILocation(line: 118, column: 5, scope: !69)
!72 = !DILocation(line: 119, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 130, type: !74, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!16, !16, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 130, type: !16)
!80 = !DILocation(line: 130, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 130, type: !76)
!82 = !DILocation(line: 130, column: 27, scope: !73)
!83 = !DILocation(line: 133, column: 22, scope: !73)
!84 = !DILocation(line: 133, column: 12, scope: !73)
!85 = !DILocation(line: 133, column: 5, scope: !73)
!86 = !DILocation(line: 135, column: 5, scope: !73)
!87 = !DILocation(line: 136, column: 5, scope: !73)
!88 = !DILocation(line: 137, column: 5, scope: !73)
!89 = !DILocation(line: 140, column: 5, scope: !73)
!90 = !DILocation(line: 141, column: 5, scope: !73)
!91 = !DILocation(line: 142, column: 5, scope: !73)
!92 = !DILocation(line: 144, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "i", scope: !93, file: !12, line: 58, type: !16)
!95 = !DILocation(line: 58, column: 9, scope: !93)
!96 = !DILocalVariable(name: "k", scope: !93, file: !12, line: 58, type: !16)
!97 = !DILocation(line: 58, column: 11, scope: !93)
!98 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 59, type: !16)
!99 = !DILocation(line: 59, column: 9, scope: !93)
!100 = !DILocation(line: 61, column: 10, scope: !93)
!101 = !DILocation(line: 62, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !93, file: !12, line: 62, column: 5)
!103 = !DILocation(line: 62, column: 9, scope: !102)
!104 = !DILocation(line: 62, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 62, column: 5)
!106 = !DILocation(line: 62, column: 18, scope: !105)
!107 = !DILocation(line: 62, column: 5, scope: !102)
!108 = !DILocation(line: 65, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !12, line: 63, column: 5)
!110 = !DILocation(line: 66, column: 5, scope: !109)
!111 = !DILocation(line: 62, column: 24, scope: !105)
!112 = !DILocation(line: 62, column: 5, scope: !105)
!113 = distinct !{!113, !107, !114, !37}
!114 = !DILocation(line: 66, column: 5, scope: !102)
!115 = !DILocation(line: 67, column: 11, scope: !116)
!116 = distinct !DILexicalBlock(scope: !93, file: !12, line: 67, column: 5)
!117 = !DILocation(line: 67, column: 9, scope: !116)
!118 = !DILocation(line: 67, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 67, column: 5)
!120 = !DILocation(line: 67, column: 18, scope: !119)
!121 = !DILocation(line: 67, column: 5, scope: !116)
!122 = !DILocalVariable(name: "buffer", scope: !123, file: !12, line: 70, type: !48)
!123 = distinct !DILexicalBlock(scope: !124, file: !12, line: 69, column: 9)
!124 = distinct !DILexicalBlock(scope: !119, file: !12, line: 68, column: 5)
!125 = !DILocation(line: 70, column: 17, scope: !123)
!126 = !DILocation(line: 72, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 72, column: 17)
!128 = !DILocation(line: 72, column: 22, scope: !127)
!129 = !DILocation(line: 72, column: 27, scope: !127)
!130 = !DILocation(line: 72, column: 30, scope: !127)
!131 = !DILocation(line: 72, column: 35, scope: !127)
!132 = !DILocation(line: 72, column: 17, scope: !123)
!133 = !DILocation(line: 74, column: 37, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !12, line: 73, column: 13)
!135 = !DILocation(line: 74, column: 30, scope: !134)
!136 = !DILocation(line: 74, column: 17, scope: !134)
!137 = !DILocation(line: 75, column: 13, scope: !134)
!138 = !DILocation(line: 78, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !127, file: !12, line: 77, column: 13)
!140 = !DILocation(line: 81, column: 5, scope: !124)
!141 = !DILocation(line: 67, column: 24, scope: !119)
!142 = !DILocation(line: 67, column: 5, scope: !119)
!143 = distinct !{!143, !121, !144, !37}
!144 = !DILocation(line: 81, column: 5, scope: !116)
!145 = !DILocation(line: 82, column: 1, scope: !93)
!146 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "h", scope: !146, file: !12, line: 87, type: !16)
!148 = !DILocation(line: 87, column: 9, scope: !146)
!149 = !DILocalVariable(name: "j", scope: !146, file: !12, line: 87, type: !16)
!150 = !DILocation(line: 87, column: 11, scope: !146)
!151 = !DILocalVariable(name: "data", scope: !146, file: !12, line: 88, type: !16)
!152 = !DILocation(line: 88, column: 9, scope: !146)
!153 = !DILocation(line: 90, column: 10, scope: !146)
!154 = !DILocation(line: 91, column: 11, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !12, line: 91, column: 5)
!156 = !DILocation(line: 91, column: 9, scope: !155)
!157 = !DILocation(line: 91, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 91, column: 5)
!159 = !DILocation(line: 91, column: 18, scope: !158)
!160 = !DILocation(line: 91, column: 5, scope: !155)
!161 = !DILocation(line: 95, column: 14, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 92, column: 5)
!163 = !DILocation(line: 96, column: 5, scope: !162)
!164 = !DILocation(line: 91, column: 24, scope: !158)
!165 = !DILocation(line: 91, column: 5, scope: !158)
!166 = distinct !{!166, !160, !167, !37}
!167 = !DILocation(line: 96, column: 5, scope: !155)
!168 = !DILocation(line: 97, column: 11, scope: !169)
!169 = distinct !DILexicalBlock(scope: !146, file: !12, line: 97, column: 5)
!170 = !DILocation(line: 97, column: 9, scope: !169)
!171 = !DILocation(line: 97, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !12, line: 97, column: 5)
!173 = !DILocation(line: 97, column: 18, scope: !172)
!174 = !DILocation(line: 97, column: 5, scope: !169)
!175 = !DILocalVariable(name: "buffer", scope: !176, file: !12, line: 100, type: !48)
!176 = distinct !DILexicalBlock(scope: !177, file: !12, line: 99, column: 9)
!177 = distinct !DILexicalBlock(scope: !172, file: !12, line: 98, column: 5)
!178 = !DILocation(line: 100, column: 17, scope: !176)
!179 = !DILocation(line: 103, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 103, column: 17)
!181 = !DILocation(line: 103, column: 22, scope: !180)
!182 = !DILocation(line: 103, column: 17, scope: !176)
!183 = !DILocation(line: 105, column: 37, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !12, line: 104, column: 13)
!185 = !DILocation(line: 105, column: 30, scope: !184)
!186 = !DILocation(line: 105, column: 17, scope: !184)
!187 = !DILocation(line: 106, column: 13, scope: !184)
!188 = !DILocation(line: 109, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !180, file: !12, line: 108, column: 13)
!190 = !DILocation(line: 112, column: 5, scope: !177)
!191 = !DILocation(line: 97, column: 24, scope: !172)
!192 = !DILocation(line: 97, column: 5, scope: !172)
!193 = distinct !{!193, !174, !194, !37}
!194 = !DILocation(line: 112, column: 5, scope: !169)
!195 = !DILocation(line: 113, column: 1, scope: !146)
