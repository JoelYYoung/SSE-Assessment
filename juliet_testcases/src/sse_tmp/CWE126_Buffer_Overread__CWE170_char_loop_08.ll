; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_08_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %call = call i32 @staticReturnsTrue(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !40
  %cmp = icmp slt i32 %0, 99, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %1 to i64, !dbg !46
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !46
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !46
  %3 = load i32, i32* %i, align 4, !dbg !47
  %idxprom2 = sext i32 %3 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !48
  store i8 %2, i8* %arrayidx3, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %4, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay4), !dbg !57
  br label %if.end, !dbg !58

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_08_good() #0 !dbg !60 {
entry:
  call void @good1(), !dbg !61
  call void @good2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_char_loop_08_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__CWE170_char_loop_08_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !83 {
entry:
  ret i32 1, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !87 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %call = call i32 @staticReturnsFalse(), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !94, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %i, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !102
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  store i32 0, i32* %i, align 4, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %if.else
  %0 = load i32, i32* %i, align 4, !dbg !108
  %cmp = icmp slt i32 %0, 99, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !112
  %idxprom = sext i32 %1 to i64, !dbg !114
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !114
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !114
  %3 = load i32, i32* %i, align 4, !dbg !115
  %idxprom2 = sext i32 %3 to i64, !dbg !116
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !116
  store i8 %2, i8* %arrayidx3, align 1, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !119
  %inc = add nsw i32 %4, 1, !dbg !119
  store i32 %inc, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx4, align 1, !dbg !124
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @printLine(i8* %arraydecay5), !dbg !126
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !128 {
entry:
  ret i32 0, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !130 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %call = call i32 @staticReturnsTrue(), !dbg !131
  %tobool = icmp ne i32 %call, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !134, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %i, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !142
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !143
  store i8 0, i8* %arrayidx, align 1, !dbg !144
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !148
  %cmp = icmp slt i32 %0, 99, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !152
  %idxprom = sext i32 %1 to i64, !dbg !154
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !154
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !154
  %3 = load i32, i32* %i, align 4, !dbg !155
  %idxprom2 = sext i32 %3 to i64, !dbg !156
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !156
  store i8 %2, i8* %arrayidx3, align 1, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !159
  %inc = add nsw i32 %4, 1, !dbg !159
  store i32 %inc, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !163
  store i8 0, i8* %arrayidx4, align 1, !dbg !164
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !165
  call void @printLine(i8* %arraydecay5), !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !168
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 37, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!17 = !DILocation(line: 37, column: 8, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 40, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 39, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 38, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1200, elements: !23)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 40, column: 18, scope: !19)
!26 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 40, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 40, column: 28, scope: !19)
!31 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 41, type: !32)
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DILocation(line: 41, column: 17, scope: !19)
!34 = !DILocation(line: 43, column: 13, scope: !19)
!35 = !DILocation(line: 44, column: 13, scope: !19)
!36 = !DILocation(line: 44, column: 22, scope: !19)
!37 = !DILocation(line: 45, column: 18, scope: !38)
!38 = distinct !DILexicalBlock(scope: !19, file: !12, line: 45, column: 13)
!39 = !DILocation(line: 45, column: 17, scope: !38)
!40 = !DILocation(line: 45, column: 22, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 45, column: 13)
!42 = !DILocation(line: 45, column: 24, scope: !41)
!43 = !DILocation(line: 45, column: 13, scope: !38)
!44 = !DILocation(line: 47, column: 31, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 46, column: 13)
!46 = !DILocation(line: 47, column: 27, scope: !45)
!47 = !DILocation(line: 47, column: 22, scope: !45)
!48 = !DILocation(line: 47, column: 17, scope: !45)
!49 = !DILocation(line: 47, column: 25, scope: !45)
!50 = !DILocation(line: 48, column: 13, scope: !45)
!51 = !DILocation(line: 45, column: 31, scope: !41)
!52 = !DILocation(line: 45, column: 13, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 48, column: 13, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 50, column: 23, scope: !19)
!57 = !DILocation(line: 50, column: 13, scope: !19)
!58 = !DILocation(line: 52, column: 5, scope: !20)
!59 = !DILocation(line: 53, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_08_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 108, column: 5, scope: !60)
!62 = !DILocation(line: 109, column: 5, scope: !60)
!63 = !DILocation(line: 110, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !65, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!32, !32, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 121, type: !32)
!70 = !DILocation(line: 121, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 121, type: !67)
!72 = !DILocation(line: 121, column: 27, scope: !64)
!73 = !DILocation(line: 124, column: 22, scope: !64)
!74 = !DILocation(line: 124, column: 12, scope: !64)
!75 = !DILocation(line: 124, column: 5, scope: !64)
!76 = !DILocation(line: 126, column: 5, scope: !64)
!77 = !DILocation(line: 127, column: 5, scope: !64)
!78 = !DILocation(line: 128, column: 5, scope: !64)
!79 = !DILocation(line: 131, column: 5, scope: !64)
!80 = !DILocation(line: 132, column: 5, scope: !64)
!81 = !DILocation(line: 133, column: 5, scope: !64)
!82 = !DILocation(line: 135, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !84, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!32}
!86 = !DILocation(line: 25, column: 5, scope: !83)
!87 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 62, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !87, file: !12, line: 62, column: 8)
!90 = !DILocation(line: 62, column: 8, scope: !87)
!91 = !DILocation(line: 65, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 63, column: 5)
!93 = !DILocation(line: 66, column: 5, scope: !92)
!94 = !DILocalVariable(name: "src", scope: !95, file: !12, line: 70, type: !21)
!95 = distinct !DILexicalBlock(scope: !96, file: !12, line: 69, column: 9)
!96 = distinct !DILexicalBlock(scope: !89, file: !12, line: 68, column: 5)
!97 = !DILocation(line: 70, column: 18, scope: !95)
!98 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 70, type: !27)
!99 = !DILocation(line: 70, column: 28, scope: !95)
!100 = !DILocalVariable(name: "i", scope: !95, file: !12, line: 71, type: !32)
!101 = !DILocation(line: 71, column: 17, scope: !95)
!102 = !DILocation(line: 73, column: 13, scope: !95)
!103 = !DILocation(line: 74, column: 13, scope: !95)
!104 = !DILocation(line: 74, column: 22, scope: !95)
!105 = !DILocation(line: 75, column: 18, scope: !106)
!106 = distinct !DILexicalBlock(scope: !95, file: !12, line: 75, column: 13)
!107 = !DILocation(line: 75, column: 17, scope: !106)
!108 = !DILocation(line: 75, column: 22, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 75, column: 13)
!110 = !DILocation(line: 75, column: 24, scope: !109)
!111 = !DILocation(line: 75, column: 13, scope: !106)
!112 = !DILocation(line: 77, column: 31, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 76, column: 13)
!114 = !DILocation(line: 77, column: 27, scope: !113)
!115 = !DILocation(line: 77, column: 22, scope: !113)
!116 = !DILocation(line: 77, column: 17, scope: !113)
!117 = !DILocation(line: 77, column: 25, scope: !113)
!118 = !DILocation(line: 78, column: 13, scope: !113)
!119 = !DILocation(line: 75, column: 31, scope: !109)
!120 = !DILocation(line: 75, column: 13, scope: !109)
!121 = distinct !{!121, !111, !122, !55}
!122 = !DILocation(line: 78, column: 13, scope: !106)
!123 = !DILocation(line: 79, column: 13, scope: !95)
!124 = !DILocation(line: 79, column: 22, scope: !95)
!125 = !DILocation(line: 80, column: 23, scope: !95)
!126 = !DILocation(line: 80, column: 13, scope: !95)
!127 = !DILocation(line: 83, column: 1, scope: !87)
!128 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !84, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocation(line: 30, column: 5, scope: !128)
!130 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocation(line: 88, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !130, file: !12, line: 88, column: 8)
!133 = !DILocation(line: 88, column: 8, scope: !130)
!134 = !DILocalVariable(name: "src", scope: !135, file: !12, line: 91, type: !21)
!135 = distinct !DILexicalBlock(scope: !136, file: !12, line: 90, column: 9)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 89, column: 5)
!137 = !DILocation(line: 91, column: 18, scope: !135)
!138 = !DILocalVariable(name: "dest", scope: !135, file: !12, line: 91, type: !27)
!139 = !DILocation(line: 91, column: 28, scope: !135)
!140 = !DILocalVariable(name: "i", scope: !135, file: !12, line: 92, type: !32)
!141 = !DILocation(line: 92, column: 17, scope: !135)
!142 = !DILocation(line: 94, column: 13, scope: !135)
!143 = !DILocation(line: 95, column: 13, scope: !135)
!144 = !DILocation(line: 95, column: 22, scope: !135)
!145 = !DILocation(line: 96, column: 18, scope: !146)
!146 = distinct !DILexicalBlock(scope: !135, file: !12, line: 96, column: 13)
!147 = !DILocation(line: 96, column: 17, scope: !146)
!148 = !DILocation(line: 96, column: 22, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 96, column: 13)
!150 = !DILocation(line: 96, column: 24, scope: !149)
!151 = !DILocation(line: 96, column: 13, scope: !146)
!152 = !DILocation(line: 98, column: 31, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !12, line: 97, column: 13)
!154 = !DILocation(line: 98, column: 27, scope: !153)
!155 = !DILocation(line: 98, column: 22, scope: !153)
!156 = !DILocation(line: 98, column: 17, scope: !153)
!157 = !DILocation(line: 98, column: 25, scope: !153)
!158 = !DILocation(line: 99, column: 13, scope: !153)
!159 = !DILocation(line: 96, column: 31, scope: !149)
!160 = !DILocation(line: 96, column: 13, scope: !149)
!161 = distinct !{!161, !151, !162, !55}
!162 = !DILocation(line: 99, column: 13, scope: !146)
!163 = !DILocation(line: 100, column: 13, scope: !135)
!164 = !DILocation(line: 100, column: 22, scope: !135)
!165 = !DILocation(line: 101, column: 23, scope: !135)
!166 = !DILocation(line: 101, column: 13, scope: !135)
!167 = !DILocation(line: 103, column: 5, scope: !136)
!168 = !DILocation(line: 104, column: 1, scope: !130)
